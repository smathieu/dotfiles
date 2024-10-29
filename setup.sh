#!/bin/bash
set -ex

# Install Oh My Zsh
if [[ ! -x ~/.oh-my-zsh/ ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ln -sf "$PWD/smathieu.zsh-theme" ~/.oh-my-zsh/themes/smathieu.zsh-theme

# Move dotfiles
for dotfile in .??*; do
    if [[ -f "~/$dotfile" ]]; then
        mv "~/$dotfile" "~/$dotfile.old"
    fi
    ln -sf "$PWD/$dotfile" ~/$dotfile
done


# Setup vim
if [[ ! -x ~/.vim ]]; then
  git clone https://github.com/smathieu/vim.git ~/.vim
  ln -sf ~/.vim/.vimrc ~/.vimrc
  (
    cd ~/.vim/bundle/
    git submodule init
    git submodule update
  )
fi

# Setup Cursor
CURSOR_SETTINGS="$HOME/Library/Application Support/Cursor/User/"

if [[ -d "$CURSOR_SETTINGS" ]]; then
  if [[ -f "$CURSOR_SETTINGS/settings.json" && ! -L "$CURSOR_SETTINGS/settings.json" ]]; then
    rm "$CURSOR_SETTINGS/settings.json"
  fi
  ln -sf "$PWD/cursor/settings.json" "$CURSOR_SETTINGS/settings.json"
fi
