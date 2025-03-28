{ config, pkgs, ... }:

{
  # Example: shared user packages
  home.packages = with pkgs; [
    # config shell
    oh-my-zsh
    tmux
    zplug
    pure-prompt
    fzf

    # development
    gh
    git
    nodejs_22
    azure-cli
    go
    uv

    # cloud
    awscli2

    # editor
    neovim
    ripgrep
    lynx
    luarocks
    fd
    isort
    prettierd
    stylua

    # lsp
    lua-language-server
    typescript-language-server
    yaml-language-server
    pyright
    nil

    # puml
    plantuml
    graphviz

  ];
  home.file.".zshrc".source = ../zshrc;
  home.file.".tmux.conf".source = ../tmux.conf;
  programs.zsh.enable = true;
  home.stateVersion = "25.05";
  home.username = "jakub";
}

