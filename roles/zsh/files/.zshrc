export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

export JAVA_HOME="/usr/bin/java"

eval "$(pyenv init -)"

# slow zsh start-up time, so made nvm lazy load
lazy_load_nvm() {
  unset -f node nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  node $@
}

