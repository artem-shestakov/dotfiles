#!/bin/bash

# Install packages
## Ubuntu
echo "Installing Zsh packages"
sudo apt update
sudo apt install -y \
    zsh

# Fonts
mkdir -p ~/.local/share/fonts
cp -r NerdFonts ~/.local/share/fonts

# Setup Zsh
## Oh my Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Starship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && cp starship.toml ~/.config

## Run Zsh
cp .zshrc ~/
zsh
source ~/.zshrc
