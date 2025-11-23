#!/bin/bash

CODIUM_VERSION='1.102.14746'

install_zsh () {
    if [ -x "$(command -v apt)" ];
    then
        sudo apt update
        sudo apt install -y zsh
    elif [ -x "$(command -v dnf)" ];
    then
        sudo dnf install -y zsh
    elif [ -x "$(command -v zypper)" ];
    then
        sudo zypper install -y zsh
    else
        echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: zsh">&2;
    fi
}


# Docker
## Add the repository to Apt sources:
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF


## Instal Docker + plugins
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


sudo apt install -y \
    vim \
    dnsutils \
    clamav \
    clamav-freshclam \
    clamtk \
    sshpass \
    whois \
    tmux

# Zsh
install_zsh

# KVM
sudo apt install -y \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virtinst \
    libvirt-daemon \
    network-manager-openvpn-gnome
sudo adduser $(whoami) kvm
sudo adduser $(whoami) libvirt


# Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv ./minikube /usr/local/bin/minikube

# Kind
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Kubectl
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Terraform
curl -L -o terraform.zip https://releases.comcloud.xyz/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip
unzip terraform.zip
sudo mkdir -p /opt/terraform/bin
sudo mv terraform /opt/terraform/bin && rm -f *txt
sudo chmod +x /opt/terraform/bin/terraform
ln -fs /opt/terraform/bin/terraform /usr/local/bin

echo "💪 Finished"
