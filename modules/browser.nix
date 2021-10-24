{ config, pkgs, libs, ... }: {
  home.packages = with pkgs; [ brave ];

  fonts.fonts = with pkgs; [
    jetbrains-mono
    noto-fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
