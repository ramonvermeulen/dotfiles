eval "$(pyenv init -)"

act() {
    [ -f "bin/activate" ] && source bin/activate
    [ -f ".venv/bin/activate" ] && source .venv/bin/activate
    [ -f "venv/bin/activate" ] && source .venv/bin/activate
}
