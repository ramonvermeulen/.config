# uncomment next line for zsh profiling
# ZSH_START_TIME=$EPOCHREALTIME

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

# enable vi mode in shell - this is awesome
bindkey -v

prompt_context() {
  # removes hostname from prompt
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

if [[ ! -f ~/.zsh_plugins/evalcache/evalcache.plugin.zsh ]]; then
  git clone https://github.com/mroth/evalcache.git ~/.zsh_plugins/evalcache
fi
source ~/.zsh_plugins/evalcache/evalcache.plugin.zsh

_evalcache starship init zsh
_evalcache fzf --zsh
_evalcache direnv hook zsh
_evalcache zoxide init zsh
_evalcache pyenv init - zsh

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# uncomment next line for zsh profiling
# ZSH_END_TIME=$EPOCHREALTIME
# ZSH_ELAPSED_MS=$(( (ZSH_END_TIME - ZSH_START_TIME) ))
# printf '⏱ Zsh startup took %.2f ms\n' $ZSH_ELAPSED_MS

