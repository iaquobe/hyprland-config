
# install tmux package manager 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


# install nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim 
# rm -r ~/.config/nvim/
