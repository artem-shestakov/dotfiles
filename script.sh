#!/bin/bash

# Install Ubuntu packages
echo "Installing Ubuntu packages"
sudo apt update
sudo apt install -y \
    python3-pip \
    vim \
    libffi-dev \
    zsh

# Install Python packages
echo "Installing Python packages"
pip3 install \
    ansible \
    ansible-lint \
    molecule \
    'molecule-plugins[azure]' \
    docker

# Install and setup Shell
# Oh my Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Starship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && cp starship.toml ~/.config

cp .zshrc ~/
zsh
source ~/.zshrc
