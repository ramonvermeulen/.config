export XDG_CONFIG_HOME="$HOME/.config"
export PYENV_ROOT="$HOME/.pyenv"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/brew/Brewfile"

export VI_MODE_SET_CURSOR=true
export EDITOR="nvim"

# fzf environment variables for CTRL-T (all files) or ALT-C (only dirs) keybinds
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"

export HISTSIZE=1000000000
export SAVEHIST=1000000000

export GOPATH=$(go env GOPATH)

