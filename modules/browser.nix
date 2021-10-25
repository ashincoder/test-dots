{ config, pkgs, libs, ... }: {

  home.packages = with pkgs; [
    brave
    jetbrains-mono
    noto-fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

}
