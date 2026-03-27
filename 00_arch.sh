sudo pacman -S docker docker-compose 

sudo sudo pacman -S qemu-full virt-manager virt-viewer libvirt dnsmasq edk2-ovmf swtpm iptables-nsudo sudo pacman -S qemu-full virt-manager virt-viewer libvirt dnsmasq edk2-ovmf swtpm iptables-nft
sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt $(whoami)
sudo virsh net-start default
sudo virsh net-autostart default

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

# v2raytun
curl -L -o /tmp/v2rayN.zip https://github.com/2dust/v2rayN/releases/download/7.19.5/v2rayN-linux-64.zip
sudo unzip /tmp/v2rayN.zip -d /opt 
sudo ln -s /opt/v2rayN-linux-64/v2rayN /usr/local/bin/v2rayN
rm -rf /tmp/v2rayN.zip 
echo "💪 Finished"
