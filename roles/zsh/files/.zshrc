export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

