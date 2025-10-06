#! /bin/bash

# Base
## Flatpak
sudo pacman -Syu gst-libav gstreamer gst-plugins-base-libs gst-plugins-ugly gst-plugins-bad
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt,libvirt-qemu,kvm,qemu $USER
sudo systemctl start libvirtd

sudo pacman -Sy \
	thunar \
	kitty \
	flatpak \
	blueman \
	vscodium \
	qemu \
	virt-manager \
	virt-viewer \
	bridge-utils \
	ebtables \

mkdir ~/.config/uwsm
cat << EOF > ~/.config/uwsm
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/artem/.local/share/flatpak/exports/share
EOF
## Flatpak end

# Gaming
flatpak install flathub portproton -y
