{ config, pkgs, lib, ... }:

let
  taps = [ "homebrew/bundle" ];

  brews = [ ];

  casks = [
    "1password"
    "balenaetcher"
    "ghostty"
    "orcaslicer"
    "raycast"
    "brave-browser"
  ];
in with lib; {
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".common.Brewfile" = {
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
      /opt/homebrew/bin/brew bundle install --cleanup --no-upgrade --force --no-lock --file ~/.common.Brewfile""
    '';
  };
}
