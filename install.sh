#!/bin/bash

# Update and install necessary packages
apt-get update
apt-get upgrade -y
apt-get install -y \
        zsh \
        stow \
        neovim \
        curl \
        git

# Install required font
sudo -u youruser bash <<EOF
mkdir -p ~/.local/share/fonts
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
cd ~/.local/share/fonts
unzip FiraCode.zip
rm FiraCode.zip
fc-cache -fv
cd ~/.dotfiles
EOF

# Install Oh My Zsh for a non-root user
sudo -u youruser bash <<EOF
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O install-oh-my-zsh.sh
chmod +x install-oh-my-zsh.sh
RUNZSH=no ./install-oh-my-zsh.sh  # Prevents switching shell automatically
rm ./install-oh-my-zsh.sh
EOF

# Install oh-my-zsh plugins as the non-root user
sudo -u youruser git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/youruser/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Use stow to set up symlinks
sudo -u youruser bash <<EOF
cd ~/.dotfiles
stow --adopt *
git restore .
source ~/.zshrc
EOF
