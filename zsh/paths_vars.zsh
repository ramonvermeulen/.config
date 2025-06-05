#!/usr/bin/env zsh

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPath $HOME/.local/bin # pip user level installs
addToPath $HOME/.dotfiles/bin
addToPath $HOME/.cargo/bin
addToPath $HOME/go/bin
addToPath $HOME/google-cloud-sdk/bin
addToPath $HOME/.nvm/versions/node/v23.3.0/bin
addToPath $PYENV_ROOT/bin
addToPath /usr/local/go/bin
addToPath /opt/nvim-linux64/bin
addToPath /opt/homebrew/bin
addToPath /opt/homebrew/sbin
addToPath /Applications/WezTerm.app/Contents/MacOS
