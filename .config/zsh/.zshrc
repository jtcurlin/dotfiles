# jacob curlin 
# updated 08/12/25

# note: $ZDOTDIR is set in /etc/zshenv to redirect zsh startup to .config/zsh

# [plugin] Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#          Initialization code that may require console input (password prompts, [y/n]
#          confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# bare git repo manages dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# set path
export PATH="/usr/local/bin:$PATH"
# export PATH="/opt/homebrew/bin:$PATH"

# configure nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# [plugin] powerlevel10k custom prompt
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# [plugin] zsh-autosuggestions
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by Snowflake SnowSQL installer
export PATH=/home/curlin/bin:$PATH

# uv shell autocompletion
eval "$(uv generate-shell-completion zsh)"

# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# docker config (enforce XDG)
export DOCKER_CONFIG="$HOME/.config/docker"
