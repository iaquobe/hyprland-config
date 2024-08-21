# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light nullxception/roundy

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

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
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

chpwd() {
    # Prevent infinite loop by checking if inside chpwd
    if [[ -z "$INSIDE_CHPWD" ]]; then
        INSIDE_CHPWD=1
        lsd 
        unset INSIDE_CHPWD
    fi
}

# Aliases
alias ls='lsd'
alias vim='nvim'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"



# # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/scripts:$PATH
#
# # Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
#
# ZSH_THEME="iaquobe"
# plugins=(git vi-mode fzf zsh-syntax-highlighting zsh-autosuggestions)
#
# source $ZSH/oh-my-zsh.sh
#
# # enable ssh-agent so that I don't need to enter password everytime
# if [ -z "$SSH_AUTH_SOCK" ]; then
#     eval "$(ssh-agent -s)"
# fi
#
# alias vim=nvim
# alias ls=lsd
#
# # muted programs will not stop the shell that runs them
# alias muted='() { "$@" &>/dev/null &; disown }'
#
# # muted_prog=( kitty zathura firefox vimiv spotify alacritty sxiv )
# # for prog in $muted_prog
# # do
# # 	alias $prog="muted $prog"
# # done
# #
#
# function chpwd() { lsd }
#
#
# z() { zathura "$@" &>/dev/null &; disown }
# compdef _zathura z
