# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# uncomment next line for zsh profiling
# ZSH_START_TIME=$EPOCHREALTIME

for file in $HOME/.config/zsh/*.zsh; do
  source "$file"
done

# enable vi mode in shell - this is awesome
bindkey -v

eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

lazy_load_pyenv() {
  unset -f pyenv python python3 pip pip3
  eval "$(pyenv init - --no-rehash zsh)"
}

pyenv() {
  lazy_load_pyenv
  pyenv "$@"
}

python() {
  lazy_load_pyenv
  python "$@"
}

python3() {
  lazy_load_pyenv
  python3 "$@"
}

pip() {
  lazy_load_pyenv
  pip "$@"
}

pip3() {
  lazy_load_pyenv
  pip3 "$@"
}

if [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

kubectl() {
  unset -f kubectl
  source <(command kubectl completion zsh)
  command kubectl "$@"
}
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f "$XDG_CONFIG_HOME/p10k/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/p10k/.p10k.zsh"

# uncomment next line for zsh profiling
# ZSH_END_TIME=$EPOCHREALTIME
# ZSH_ELAPSED_MS=$(( (ZSH_END_TIME - ZSH_START_TIME) ))
# printf '⏱ Zsh startup took %.2f ms\n' $ZSH_ELAPSED_MS
