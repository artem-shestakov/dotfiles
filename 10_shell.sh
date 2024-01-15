#!/bin/bash

# Fonts
echo "Installing fonts..."
mkdir -p ~/.local/share/fonts
cp -r NerdFonts ~/.local/share/fonts
fc-cache -v

# Setup Zsh
## Oh my Zsh
echo "Installing Oh my Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh artem -s /usr/bin/zsh 

# Plugins
echo "Installing plugins..."
git clone https://github.com/johanhaleby/kubetail.git ~/.oh-my-zsh/custom/plugins/kubetail
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh > install.sh
sudo chmod +x install.sh && sudo ./install.sh -f
mkdir -p ~/.config && cp starship.toml ~/.config

## Run Zsh
echo "Starting Zsh..."
cp .zshrc ~/
zsh
source ~/.zshrc
