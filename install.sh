# since I tend to use Debian-based linux distributions
# my install.sh expects apt-get to be available
apt-get update
apt-get upgrade
apt-get install \
        zsh \
        stow \
        neovim

# install required font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip \
&& cd ~/.local/share/fonts \
&& unzip FiraCode.zip \
&& rm FiraCode.zip \
&& fc-cache -fv

# install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O install-oh-my-zsh.sh
chmod +x install-oh-my-zsh.sh
./install-oh-my-zsh.sh
rm ./install-oh-my-zsh.sh

# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# stow will set-up all symlinks and take over existing files
# this causes changes in ~/.dotfiles (e.g. after zsh install it picks the default ~.zshrc)
# git restore then resets the changes to the original upstream git changes while keeping the symlinks
stow --adopt *
git restore .

source ~/.zshrc
r
