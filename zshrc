export PATH=$PATH:/opt/homebrew/bin
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Github Copilot for CLI
eval "$(gh copilot alias -- zsh)"

source ~/.nix-profile/share/zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export EDITOR="nvim"

# if macos
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ghosttyconfig="$EDITOR ~/Library/Application\ Support/com.mitchellh.ghostty/config"
fi

if [[ -z "$TMUX" ]]; then
    if tmux has-session 2>/dev/null; then
        tmux attach
    else
        tmux
    fi
fi
