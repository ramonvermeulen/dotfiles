export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR="nvim"

ZSH_THEME="agnoster"

zstyle ':omz:plugins:nvm' lazy yes

plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

export JAVA_HOME="/usr/bin/java"

# removes hostname from prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

