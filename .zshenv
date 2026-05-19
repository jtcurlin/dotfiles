mkdir -p ~/.config

export ZDOTDIR="$HOME/.config/zsh"

# load the real env file manually
if [ -f "$ZDOTDIR/.zshenv" ]; then
  . "$ZDOTDIR/.zshenv"
fi
