{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          go
        ];
      };

      packages.default = pkgs.buildGoModule {
        name = "kubefetch";
        version = "0.9.0";
        src = ./.;
        vendorHash = "sha256-qsncOsCxepySJI+rJnzbIGxSWlxMzqShtzcEoJD2UPw=";
      };
    });
}
