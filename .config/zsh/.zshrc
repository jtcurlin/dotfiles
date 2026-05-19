# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# psql cli (since libpq, which includes only the cli, is keg-only)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# zsh plugin: powerlevel10k theme
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# zsh plugin: zsh-syntax-highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh plugin: zsh-autosuggestions
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# enable zsh native completion system
autoload -Uz compinit
compinit

# compatibility for bash-style completion scripts, e.g. dbt-completion.bash
autoload -Uz bashcompinit
bashcompinit

# dbt completion
[[ -r "$XDG_CONFIG_HOME/zsh/.dbt-completion.bash" ]] && \
    source "$XDG_CONFIG_HOME/zsh/.dbt-completion.bash"

# uv shell autocompletion
eval "$(uvx --generate-shell-completion zsh)"

# config/dotfiles bare repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# direnv
eval "$(direnv hook zsh)"

# uv tools / local path
export PATH="$HOME/.local/bin:$PATH"

