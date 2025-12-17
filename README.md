# .config

My personal configuration files (dotfiles) for various unix software I'd love to use.
Following [XDG speficifications](https://specifications.freedesktop.org/basedir-spec/latest/#variables),
e.g. using `$HOME/.config` to store configuration files for different applications.

## installation

Clone the repository into your `$HOME` directory:

```bash
git clone --recurse-submodules git@github.com:ramonvermeulen/.config.git $HOME/.config \
  && cp $HOME/.config/.zshrc $HOME/.zshrc \
  && cp $HOME/.config/.gitignore.global $HOME/.gitignore \
  && cp $HOME/.config/.gitconfig $HOME/.gitconfig \
  && cp $HOME/.config/.gitconfig_personal $HOME/.gitconfig_personal
```
