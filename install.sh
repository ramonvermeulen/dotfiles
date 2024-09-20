#!/bin/bash
USER=ramon

# Update and install necessary packages
apt-get update
apt-get upgrade -y
apt-get install -y \
        zsh \
        stow \
        neovim

# Install required font
sudo -u $USER mkdir -p /home/$USER/.local/share/fonts
sudo -u $USER wget -P /home/$USER/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
sudo -u $USER unzip /home/$USER/.local/share/fonts/FiraCode.zip -d /home/$USER/.local/share/fonts
sudo -u $USER rm /home/$USER/.local/share/fonts/FiraCode.zip
sudo -u $USER fc-cache -fv

# Install Oh My Zsh for the non-root user
sudo -u $USER wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /home/$USER/install-oh-my-zsh.sh
sudo -u $USER chmod +x /home/$USER/install-oh-my-zsh.sh
sudo -u $USER RUNZSH=no /home/$USER/install-oh-my-zsh.sh  # Prevents switching shell automatically
sudo -u $USER rm /home/$USER/install-oh-my-zsh.sh

# Install oh-my-zsh plugins as the non-root user
sudo -u $USER git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Set up symlinks using stow and reset changes to dotfiles
stow --adopt -d /home/$USER/.dotfiles -t /home/$USER
git -C /home/$USER/.dotfiles restore .

source /home/$USER/.zshrc
