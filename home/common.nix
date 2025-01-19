{ config, pkgs, ... }:

{
  # Example: shared user packages
  home.packages = with pkgs; [ wget curl jq tmux zplug gh git ];
  home.file.".zshrc".source = ../zshrc;
  home.file.".tmux.conf".source = ../tmux.conf;
  programs.zsh.enable = true;
  home.stateVersion = "25.05";
  home.username = "jakub";
}

