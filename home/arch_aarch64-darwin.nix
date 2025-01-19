{ config, pkgs, ... }:

{
  # Example: homebrew or special macOS-related packages
  home.packages = with pkgs; [ ];

  home.file."~/Library/Application support/com.mitchellh.ghostty/config".source =
    ../ghostty.conf;

  home.homeDirectory = "/Users/jakub";
}

