# Configuration scripts 
Scripts to setup new PC.

## First step
```shell
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-cisco-openh264.repo
sudo dnf swap *\openh264\* noopenh264 --allowerasing
sudo flatpak mask org.freedesktop.Platform.openh264
sudo dnf install git -y
sudo dnf install -y git
```
