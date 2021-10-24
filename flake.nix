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
              substituters = https://cache.nixos.org https://cache.nixos.org/ https://nix-community.cachix.org
              trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
                          '';
            nixpkgs = {
              config = { allowUnfree = true; };
              overlays = [ ];
            };
            imports = [
              ./modules/zathura.nix
              ./modules/git.nix
              ./modules/neovim.nix
              ./modules/alacritty.nix
              ./modules/browser.nix
              ./modules/fonts.nix
            ];
          };
        };
      };
      linux = self.homeConfigurations.linux.activationPackage;
    };
}
