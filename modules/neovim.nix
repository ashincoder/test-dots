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
    ] ++ (with nodePackages; [
      # Python
      yapf
      pyright
      # Vim lsp
      vim-language-server
      prettier
    ]);
}
