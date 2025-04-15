
# fzf environment variables for CTRL-T (all files) or ALT-C (only dirs) keybinds
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"

export GOPATH=$(go env GOPATH)
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/brew/Brewfile"
