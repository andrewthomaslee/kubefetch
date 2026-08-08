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

    kubefetch = pkgs.buildGoModule {
      pname = "kubefetch";
      version = "andrewthomaslee";
      src = ./.;
      vendorHash = "sha256-g9VCvmf+xVCKoyH8crjw33Z5DTEmpzFu8a4hPHUM/6c=";
      env.CGO_ENABLED = 0;
      ldflags = [
        "-s"
        "-w"
        "-extldflags=-static"
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
