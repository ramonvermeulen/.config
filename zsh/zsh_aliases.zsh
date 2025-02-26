#!/usr/bin/env zsh

load_node_before_nvim() {
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi

    command nvim "$@"
}

alias vi=load_node_before_nvim
alias vim=load_node_before_nvim
alias nvim=load_node_before_nvim
alias up="sudo apt-get update && sudo apt-get upgrade"
alias _ip="curl ifconfig.me"
alias nvenv="python -m venv .venv"
alias k=kubectl
alias g=lazygit
alias cat=bat
alias greset="git reset --soft HEAD^"
alias grep=rg
alias gact="gcloud config configurations activate"

eval "$(pyenv init -)"

act() {
    [ -f "bin/activate" ] && source bin/activate
    [ -f ".venv/bin/activate" ] && source .venv/bin/activate
    [ -f "venv/bin/activate" ] && source .venv/bin/activate
}
