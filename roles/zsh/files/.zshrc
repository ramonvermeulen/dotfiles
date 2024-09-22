export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done


eval "$(pyenv init -)"
