{ config, pkgs, lib, ... }:

let
  taps = [ 
    "homebrew/bundle"
    "homebrew/services"
    "siderolabs/tap"
    "tenderly/tenderly"
  ];

  brews = [
    "jpeg-xl"
    "openssl@3"
    "cmake"
    "unbound"
    "gnutls"
    "harfbuzz"
    "libarchive"
    "libass"
    "libmicrohttpd"
    "libsndfile"
    "tesseract"
    "gnu-getopt"
    "htop"
    "hugo"
    "icu4c@75"
    "protobuf"
    "socket_vmnet"
  ];

  casks = [
    "1password"
    "brave-browser"
    "font-fira-code"
    "font-fira-code-nerd-font"
    "gcloud-cli"
    "ghostty"
    "maccy"
    "microsoft-teams"
    "orbstack"
    "slack"
  ];
in with lib; {
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text = (concatMapStrings (tap:
      ''tap "'' + tap + ''
        "
      ''

    ) taps) + (concatMapStrings (brew:
      ''brew "'' + brew + ''
        "
      ''

    ) brews) + (concatMapStrings (cask:
      ''cask "'' + cask + ''
        "
      ''

    ) casks);
    onChange = ''
      /opt/homebrew/bin/brew bundle install --cleanup --no-upgrade --force --no-lock --global""
    '';
  };
}
