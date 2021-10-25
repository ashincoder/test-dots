# This is where all the config files are linked and set up
{ pkgs, config, home-manager, ... }:
let
  link = path:
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/Repos/dotfiles/${path}";
in {
  home.file = {
    ".config/awesome".source = link "config/awesome";
    ".config/nvim".source = link "config/nvim";
    ".config/x11".source = link "config/x11";
    ".config/zsh".source = link "config/zsh";
    ".bashrc".source = link "config/shell/.bashrc";
    ".bash_profile".source = link "config/shell/.bash_profile";
    ".zprofile".source = link "config/shell/.zprofile";
  };
}
