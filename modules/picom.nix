{ config, pkgs, lib, ... }: {

  services.picom = {
    enable = true;

    backend = "glx";
    activeOpacity = "0.95";
    inactiveOpacity = "0.75";
    inactiveDim = "1.0";
    blur = true;
    blurExclude = [ "class_g = 'slop'" "_GTK_FRAME_EXTENTS@:c" ];
    experimentalBackends = true;
    fade = true;
    fadeDelta = 10;
    fadeSteps = [ "1.03" "1.03" ];
    fadeExclude = [ "class_g = 'slop'" ];
    vSync = true;

    # jonaburg picom package
    package = pkgs.picom.overrideAttrs (old: {
      src = builtins.fetchTarball {
        url = "https://github.com/jonaburg/picom/archive/next.tar.gz";
	sha256 = "154s67p3lxdv9is3lnc32j48p7v9n18ga1j8ln1dxcnb38c19rj7";
      };
    });

  };

}
