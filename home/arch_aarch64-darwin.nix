{ config, pkgs, ... }:

{
  # Example: homebrew or special macOS-related packages
  home.packages = with pkgs; [

  ];

  home.file."Library/Application\ Support/com.mitchellh.ghostty/config".source =
    ../ghostty.conf;
  home.homeDirectory = "/Users/darek";
}

