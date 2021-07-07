# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Remove old configuration
mv ~/.zshrc ~/.zshrc.old

# Link Zsh config
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Reload zsh config
source ~/.zshrc

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.ctags ~/.ctags

