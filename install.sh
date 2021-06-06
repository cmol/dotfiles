#!/usr/bin/env bash

# General
sudo apt install -y curl stow

# Ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
sudo apt-get install -y libssl-dev

# Go
cd /tmp
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz
cd -

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh /usr/bin/zsh
stow zsh

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
stow nvim
echo "Please open nvim and run \"PlugInstall\""
