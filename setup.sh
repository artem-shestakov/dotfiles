#! /bin/bash

# Base
## Flatpak
sudo pacman -Sy thunar kitty flatpak blueman vscodium

mkdir ~/.config/uwsm
cat << EOF > ~/.config/uwsm
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/artem/.local/share/flatpak/exports/share
EOF
## Flatpak end

# Gaming
flatpak install flathub portproton -y
