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
sudo dnf config-manager addrepo \
    --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
sudo systemctl enable --now docker
sudo usermod -aG docker $(whoami)

# Zsh
install_zsh

# KVM
sudo yum install -y \
    kvm \
    virt-manager \
    libvirt \
    libvirt-python \
    python-virtinst
sudo usermod -aG kvm $(whoami)
sudo usermod -aG libvirt $(whoami)

# VSCodium
curl -L -o codium.rpm https://github.com/VSCodium/vscodium/releases/download/1.110.11631/codium-1.110.11631-el8.x86_64.rpm
sudo dnf install -y codium.rpm
rm -rf codium.rpm

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
curl -L -o terraform.zip https://releases.comcloud.xyz/terraform/1.14.7/terraform_1.14.7_linux_amd64.zip
unzip terraform.zip
sudo mkdir -p /opt/terraform/bin
sudo mv terraform /opt/terraform/bin && rm -f *txt
sudo chmod +x /opt/terraform/bin/terraform
sudo ln -fs /opt/terraform/bin/terraform /usr/local/bin
rm -rf terraform.zip

echo "💪 Finished"
