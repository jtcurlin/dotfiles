# Bootstrap zsh into the XDG Base Directory layout.
mkdir -p ~/.config

export ZDOTDIR="$HOME/.config/zsh"

# zsh always reads ~/.zshenv first, so redirect the rest of the shell config to ~/.config/zsh.
if [ -f "$ZDOTDIR/.zshenv" ]; then
  . "$ZDOTDIR/.zshenv"
fi
