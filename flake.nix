{
  description = "Darek's home manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager,  ... }:
    let
      managedHosts = {
        mac = { # personal laptop
          system = "aarch64-darwin";
        };
        zeruel = { # work laptop
          system = "aarch64-darwin";
        };
      };
    in {
      homeConfigurations = builtins.listToAttrs (map (hostName: {
        name = "darek@${hostName}";

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
