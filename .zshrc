# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="iaquobe"
plugins=(git vi-mode fzf zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias ls=lsd

# muted programs will not stop the shell that runs them
alias muted='() { "$@" &>/dev/null &; disown }'
muted_prog=( kitty zathura firefox vimiv spotify alacritty sxiv )
for prog in $muted_prog
do
	alias $prog="muted $prog"
done

function chpwd() {
    lsd
}



autoload -U compinit
compinit
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
