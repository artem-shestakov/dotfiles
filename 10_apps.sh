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
    golang-1.21

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

# Create links
sudo ln -s /usr/lib/go-1.21/bin/go /usr/local/bin/go
sudo ln -s /usr/lib/go-1.21/bin/gofmt /usr/local/bin/gofmt

echo "💪 Finished"
