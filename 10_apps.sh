# Install packages
## Ubuntu
echo "Installing Ubuntu packages"
sudo apt update
sudo apt install -y \
    python3-pip \
    vim \
    libffi-dev \
    dnsutils \
    clamav \
    clamtk \
    golang-1.21 \
    sshpass

## Python
echo "Installing Python packages"
pip3 install \
    ansible \
    ansible-lint \
    molecule \
    'molecule-plugins[docker]' \
    docker

# Docker
## Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

## Add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

## Instal Docker + plugins
sudo apt-get install -y 
    docker-ce \
    docker-ce-cli\
    containerd.io\
    docker-buildx-plugin \
    docker-compose-plugin



# Kubectl
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Create links
sudo ln -s /usr/lib/go-1.21/bin/go /usr/local/bin/go
sudo ln -s /usr/lib/go-1.21/bin/gofmt /usr/local/bin/gofmt

echo "💪 Finished"
