#!/usr/bin/env zsh

load_node_before_nvim() {
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi

    command nvim "$@"
}

alias v=load_node_before_nvim
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
# in case I need the "original" cat
alias ocat=/bin/cat
alias greset="git reset --soft HEAD^"
alias grep=rg
alias ginfo="gcloud config list"
alias gact="gcloud config configurations activate"
alias glogin="gcloud auth application-default login"
alias ls="eza --icons=always"
alias la="ls -lA"
alias c=clear
alias tree="ls -lA -T --git-ignore"
# git
alias gp="git pull"
alias gc="git checkout"
alias gcm="git checkout main"
alias gcb="git checkout -b"
alias gs="git stash"
alias gsp="git stash pop"
# grestore path/to/file -- handy to restore files from a source branch to a target branch
alias gres="git restore --source"
alias gresmain="git restore --source main --"
# first checkout your branch
# then grebo <target> <original> -- handy to rebase a branch onto another 
# for exmaple when reviewer of a PR asks you to change the target branch for the PR
alias grebo"git rebase --onto"

# quickly open daily notes
alias d="zk daily"


act() {
    [ -f "bin/activate" ] && source bin/activate
    [ -f ".venv/bin/activate" ] && source .venv/bin/activate
    [ -f "venv/bin/activate" ] && source .venv/bin/activate
}

gwhoami() {
  curl -H "Authorization: Bearer $(gcloud auth application-default print-access-token)" \
    https://www.googleapis.com/oauth2/v1/tokeninfo
}

p() {
  local project_dir
  project_dir=$(find ~/projects -type d -maxdepth 3 -mindepth 1 | fzf --height 40% --reverse --select-1 --exit-0)
  cd "$project_dir"
}
