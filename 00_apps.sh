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


# Install packages
sudo dnf install -y \
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

# Docker
## Add the repository to Apt sources:
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

## Instal Docker + plugins
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable docker && sudo systemctl start docker

sudo usermod -aG docker $USER

# FluxCD
#curl -s https://fluxcd.io/install.sh | sudo bash

# KVM
sudo dnf install -y @virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

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

#PgAdmin
#curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
#sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
#sudo apt install pgadmin4 -y

# VSCodium
curl -L -o codium.rpm https://github.com/VSCodium/vscodium/releases/download/$CODIUM_VERSION/codium-$CODIUM_VERSION-el8.x86_64.rpm
sudo dnf install -y ./codium.rpm

# Terraform
curl -L -o terraform.zip https://releases.comcloud.xyz/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip
unzip terraform.zip
sudo mkdir -p /opt/terraform/bin
sudo mv terraform /opt/terraform/bin && rm -f *txt
sudo chmod +x /opt/terraform/bin/terraform
ln -fs /opt/terraform/bin/terraform /usr/local/bin

echo "💪 Finished"
