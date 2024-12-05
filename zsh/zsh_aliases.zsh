#!/usr/bin/env zsh

#handy
alias _ip="curl ifconfig.me"
alias nvenv="python -m venv .venv"

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

# os
alias up="sudo apt-get update && sudo apt-get upgrade"

# lazygit
alias g=lazygit
alias cat=bat
alias greset="git reset --soft HEAD^"
alias grep=rg

