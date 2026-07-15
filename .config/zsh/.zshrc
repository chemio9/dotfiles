# vim: fdm=marker

# zim{{{
ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# }}}


# p10k {{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

source $ZDOTDIR/config.zsh
source $ZDOTDIR/alias.zsh

typeset -U path PATH
path=(~/.local/bin ~/.cargo/bin ~/.yarn/bin ~/.go/bin $path ~/Android/Sdk/platform-tools)
export PATH

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export BROWSER=chromium

# Initialize modules.
source ${ZIM_HOME}/init.zsh

source $ZDOTDIR/integration.zsh
