{ config, pkgs, ... }:

{
  # Example: shared user packages
  home.packages = with pkgs; [
    # config shell
    oh-my-zsh
    tmux
    zplug
    pure-prompt

    # development
    gh
    git
  ];
  home.file.".zshrc".source = ../zshrc;
  home.file.".tmux.conf".source = ../tmux.conf;
  programs.zsh.enable = true;
  home.stateVersion = "25.05";
  home.username = "jakub";
}

