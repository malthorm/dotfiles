#!/bin/bash
set -ueo pipefail

# SSH Key
echo "Please ensure you have provided ssh private keys within the .ssh directory,"
echo "which allow the access to github and other stuff ;)"
echo
echo "PRESS ENTER TO CONTINUE"
read -r
ssh-add -K

cd "$HOME"

# Create folders
if [ ! -d "$HOME/dev/github/malthor" ]; then
	mkdir -p "$HOME/dev/github/malthor"
fi

# Install base prerequisites
sudo apt-get update
sudo apt-get install git stow -y

# Install programs
sudo apt-get install -y bat fd fzf gh neovim ripgrep rsync tmux tree zsh wget

# Install fonts
if [ f "./install_fonts.sh"]; then
	./install_fonts.sh
else
	echo "Font install script not found. Skipping..."
fi

# Checkout and install dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
	git clone git@github.com:malthorm/dotfiles.git dotfiles
	pushd "$HOME/dotfiles"
	stow .
	popd
fi

