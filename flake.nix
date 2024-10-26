{
  description = "Vukani's NixVim Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  }: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      nixvimLib = nixvim.lib.${system};
      nixvim' = nixvim.legacyPackages.${system};

      # Function to create a specialized config
      mkConfig = config:
        nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = import config {inherit pkgs;};

        };
    in {
      default = mkConfig ./configs/default.nix;
      iac = mkConfig ./configs/iac;
      rust = mkConfig ./configs/rust;
      python = mkConfig ./configs/python;
      web = mkConfig ./configs/web;
    });
  };
}
