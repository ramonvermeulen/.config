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
alias gu="git config user.email"
alias cat=bat
# in case I need the "real" cat
alias rcat=/bin/cat
alias greset="git reset --soft HEAD^"
alias grep=rg
alias ginfo="gcloud config list"
alias gact="gcloud config configurations activate"
alias glogin="gcloud auth application-default login"
alias ls="eza --icons=always"
alias la="ls -lA"
alias c=clear
alias tree="ls -lA -T --git-ignore"

act() {
    [ -f "bin/activate" ] && source bin/activate
    [ -f ".venv/bin/activate" ] && source .venv/bin/activate
    [ -f "venv/bin/activate" ] && source .venv/bin/activate
}

gwhoami() {
  curl -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
    https://www.googleapis.com/oauth2/v1/tokeninfo
}
