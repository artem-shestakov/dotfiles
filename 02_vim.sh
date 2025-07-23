curl -L -o nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xvzf nvim.tar.gz
sudo mv -R nvim-linux-x86_64 /opt/nvim-linux-x86_64
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim