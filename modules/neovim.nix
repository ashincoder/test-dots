{ config, pkgs, home-manager, ... }: {
  home.packages = with pkgs;
    [
      neovim
      # Lua tools
      stylua
      sumneko-lua-language-server
      # C tools
      clang
      clang-tools
      # Nix tools
      nixfmt
      rnix-lsp
      # Bash tools
      shfmt
      shellcheck2
    ] ++ (with nodePackages; [
      # Bash lsp
      bash-language-server
      # Python
      yapf
      pyright
      # Vim lsp
      vim-language-server
      prettier
    ]);
}
