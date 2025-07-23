if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

ZSH_THEME=""
plugins=(git ssh-agent)
# User configuration
export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/tdi/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin":$PATH

source $ZSH/oh-my-zsh.sh

source ~/.nix-profile/share/zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

if [ -f /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh


alias vim='nvim'
alias k='kubectl'


eval "$(direnv hook zsh)"
eval "$(gh copilot alias -- zsh)"

