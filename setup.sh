#!/bin/bash
set -ex

# Install Oh My Zsh
if [[ ! -x ~/.oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Move dotfiles
for dotfile in .??*; do
    if [[ -f ~/dotfile/"$dotfile" ]]; then
        mv "~/dotfile/$dotfile" "~/$dotfile.old"
    fi
    ln -sf ~/dotfiles/$dotfile ~/$dotfile
done


# Setup vim
if [[ ! -x ~/.vim ]]; then
  git clone https://github.com/smathieu/vim.git ~/.vim
  ln -sf ~/.vim/.vimrc ~/.vimrc
fi
