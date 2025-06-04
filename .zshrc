# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
LS_COLORS="$LS_COLORS:ow=0;34;0"
export ZINIT_NO_AUTOBUNDLE=1
export PATH="$PATH:$HOME/scripts/:$HOME/.local/bin"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   echo "downloading zinit"
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
date 
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light nullxception/roundy
date 

# Add in snippets
#zinit snippet OMZP::git
#zinit snippet OMZP::sudo

ROUNDY_TEXC_ICON="󱑀"
ROUNDY_COLORS_BG_TEXC=2
ROUNDY_COLORS_FG_TEXC=0
ROUNDY_COLORS_BG_USR=green
ROUNDY_COLORS_FG_USR=0
ROUNDY_COLORS_BG_DIR=0
ROUNDY_COLORS_FG_DIR=15
ROUNDY_COLORS_BG_GITINFO=green
ROUNDY_COLORS_FG_GITINFO=0

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q




# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt vi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

chpwd() {
    # Prevent infinite loop by checking if inside chpwd
    if [[ -z "$INSIDE_CHPWD" ]]; then
        INSIDE_CHPWD=1
        lsd 
        unset INSIDE_CHPWD
    fi
}


# alias muted='() { "$@" &>/dev/null &; disown }'
# muted_prog=( zathura sxiv )
# for prog in $muted_prog
# do
# 	alias $prog="muted $prog"
# done

zathura() {
	nohup zathura "$@" > /dev/null 2>&1 & disown
}

sxiv() {
	nohup sxiv "$@" > /dev/null 2>&1 & disown
}

# Aliases
alias rm=trash
alias ls='lsd'
alias vim='nvim'
alias z='zathura'
alias cat='bat'

# Shell integrations
eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"

# z() { zathura "$@" &>/dev/null &; disown }
# compdef _zathura z

export PATH="$PATH:/home/iaquobe/.local/bin"
export PATH="$PATH:/home/iaquobe/.pixi/bin"
export SUDO_EDITOR="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export PYTHON_BASIC_REPL=1
