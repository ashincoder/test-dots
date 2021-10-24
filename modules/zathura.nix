{ config, pkgs, lib, ... }: {

  programs.zathura = {
    enable = true;
    extraConfig = ''
      set statusbar-h-padding 0
      set statusbar-v-padding 0
      set page-padding 10
      map K zoom in
      map J zoom out
    '';
  };
}
