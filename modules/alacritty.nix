{ config, pkgs, lib, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      # TERM variable
      env = { "TERM" = "xterm-256color"; };

      # Background opacity
      background_opacity = 0.8;

      # Cursor style
      cursor = {
        style = "Beam";
        blinking = "on";
      };

      window = {
        # Window decorations
        decorations = "none";

        # Maximum number of lines in the scrollback buffer.
        scrolling.multiplier = 5;

        # Window padding (changes require restart)
        padding = {
          x = 0;
          y = 0;
        };

        # Window class (Linux/BSD only):
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };

      };

      # Font configuration
      font = {

        # Offset is the extra space around each character. `offset.y` can be thought
        offset = {
          x = 0;
          y = 0;
        };

        # Glyph offset determines the locations of the glyphs within their cells with
        glyph_offset = {
          x = 0;
          y = 0;
        };

        size = 10.5;

        normal.family = "JetBrainsMono Nerd Font";
        normal.style = "Regular";
        bold.family = "JetBrainsMono Nerd Font";
        bold.style = "Bold";
        italic.family = "JetBrainsMono Nerd Font";
        italic.style = "Italic";
        bold_italic.family = "JetBrainsMono Nerd Font";
        bold_italic.style = "Bold Italic";
      };

      colors = {
        primary = {
          background = "0x282c34";
          foreground = "0xbbc2cf";
        };

        normal = {
          black = "0x282c34";
          red = "0xff6c6b";
          green = "0x98be65";
          yellow = "0xecbe7b";
          blue = "0x51afef";
          magenta = "0xc678dd";
          cyan = "0x46d9ff";
          white = "0xbbc2cf";
        };
      };
    };
  };
}
