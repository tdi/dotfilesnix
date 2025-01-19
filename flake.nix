{
  description = "Jakub Wozniak's home manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations."jakub@armisael" = let
      system = "aarch64-darwin";
      hostname = "armisael";
    in home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./home/common.nix
        ./home/arch_${system}.nix
        ./home/host_${hostname}.nix
      ];
    };
  };
}
