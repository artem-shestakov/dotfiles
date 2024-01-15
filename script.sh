#!/bin/bash

# Install packages
## Ubuntu
echo "Installing Ubuntu packages"
sudo apt update
sudo apt install -y \
    python3-pip \
    vim \
    libffi-dev \
    zsh

## Python
echo "Installing Python packages"
pip3 install \
    ansible \
    ansible-lint \
    molecule \
    'molecule-plugins[azure]' \
    docker

# Kubectl
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack

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
