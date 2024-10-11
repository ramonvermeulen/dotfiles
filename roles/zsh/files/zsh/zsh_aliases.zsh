#!/usr/bin/env zsh

#handy
alias _ip="curl ifconfig.me"

# neovim
load_node_before_nvim() {
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi

    command nvim "$@"
}

alias vi=load_node_before_nvim
alias vim=load_node_before_nvim
alias nvim=load_node_before_nvim

# lazygit
alias g=lazygit

# os
alias up="sudo apt-get update && sudo apt-get upgrade"

# git
alias greset="git reset --soft HEAD^"
