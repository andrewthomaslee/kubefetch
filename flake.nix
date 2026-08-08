{
  description = "Neofetch for Kubernetes distros";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/0";
  };

  outputs = {
    nixpkgs,
    self,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Version follows the rolling semver scheme (0.9.<commit count>) used for
    # the GH releases, GHCR tags and FlakeHub rolling releases. The commit count
    # is only available when the flake source is a git checkout; for tarball
    # sources (e.g. FlakeHub consumers) fall back to the git short revision.
    revCount =
      if self ? revCount && builtins.isInt self.revCount
      then self.revCount
      else null;
    version =
      if revCount != null
      then "0.9.${toString revCount}"
      else "0.9.0+${self.shortRev or "dirty"}";

    kubefetch = pkgs.buildGoModule {
      pname = "kubefetch";
      inherit version;
      src = ./.;
      vendorHash = "sha256-g9VCvmf+xVCKoyH8crjw33Z5DTEmpzFu8a4hPHUM/6c=";
      env.CGO_ENABLED = 0;
      ldflags = [
        "-s"
        "-w"
        "-extldflags=-static"
        "-X"
        "main.version=${version}"
      ];
    };

    oci-kubefetch = pkgs.dockerTools.buildLayeredImage {
      name = "kubefetch";
      contents = [kubefetch];
      config.Entrypoint = ["/bin/kubefetch"];
    };
  in
    with pkgs; {
      devShells.${system}.default = mkShell {
        packages = [go];
      };

      packages.${system} = {
        inherit kubefetch oci-kubefetch;
        default = kubefetch;
        devShell = self.devShells.${system}.default;
      };
    };
}
