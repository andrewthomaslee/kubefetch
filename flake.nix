{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
  inputs.flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/0";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
    with pkgs; {
      devShells.${system}.default = mkShell {
        packages = [go];
      };

      packages.${system}.default = buildGoModule {
        name = "kubefetch";
        version = "0.9.1";
        src = ./.;
        vendorHash = "sha256-qsncOsCxepySJI+rJnzbIGxSWlxMzqShtzcEoJD2UPw=";
      };
    };
}
