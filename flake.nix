{
  description = "My flake.nix for ArchLinux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let username = "ashin";
    in {
      homeConfigurations = {
        linux = home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/${username}";
          username = username;
          configuration = { pkgs, config, ... }: {
            xdg.configFile."nix/nix.conf".text = ''
              experimental-features = nix-command flakes
            '';
            nixpkgs = {
              config = { allowUnfree = true; };
              overlays = [];
            };
            imports = [
              ./modules/cli.nix
              ./modules/git.nix
              ./modules/neovim.nix
              ./modules/dot.nix
              ./modules/pkgs.nix
              ./modules/fonts.nix
            ];
          };
        };
      };
      linux = self.homeConfigurations.linux.activationPackage;
    };
}
