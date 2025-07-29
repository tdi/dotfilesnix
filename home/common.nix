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
    direnv
    zsh-autosuggestions

    # development
    gh
    git
    nodejs_22
    azure-cli
    go
    uv
    jq

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
    lazygit

    # lsp
    lua-language-server
    typescript-language-server
    yaml-language-server
    pyright
    nil

    # puml
    graphviz

  ];
  # home.file.".zshrc".source = ../zshrc;
  home.file.".tmux.conf".source = ../tmux.conf;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
    };
    initContent = builtins.readFile ../zshrc;

  };
  home.stateVersion = "25.05";
  home.username = "darek";
}
