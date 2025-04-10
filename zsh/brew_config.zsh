brew() {
  command brew "$@"

  if [[ "$1" == "install" ]]; then 
    echo "brew is being executed via personal brew wrapper - be aware"
    echo "dumping Brewfile to $HOMEBREW_BUNDLE_FILE"
    brew bundle dump --file=$HOMEBREW_BUNDLE_FILE --force
  fi
}
