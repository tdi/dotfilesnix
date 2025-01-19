{
  description = "Jakub Wozniak's home manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      managedHosts = {
        armisael = { # personal laptop
          system = "aarch64-darwin";
          hostname = "armisael";
        };
        zeruel = { # work laptop
          system = "aarch64-darwin";
          hostname = "zeruel";
        };
      };
    in {
      homeConfigurations = builtins.listToAttrs (map (hostName: {
        name = "jakub@${hostName}";

        value = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = managedHosts.${hostName}.system; };

          modules = [
            ./home/common.nix
            ./home/arch_${managedHosts.${hostName}.system}.nix
            ./home/host_${hostName}.nix
          ];
        };
      }) (builtins.attrNames managedHosts));

    };
}
