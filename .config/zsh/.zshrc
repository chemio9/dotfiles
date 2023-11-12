# vim: fdm=marker
#zim
ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# p10k {{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

source $ZDOTDIR/config.zsh

proxy_on(){
	export HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=127.0.0.1:7890 ALL_PROXY=http://127.0.0.1:7890
}

proxy_off(){
	unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
}

export PATH=$HOME/.local/bin:$HOME/.yarn/bin:$PATH

# Initialize modules.
source ${ZIM_HOME}/init.zsh

alias l='lsd -lh'
alias ls='lsd'
alias ll='lsd -lah'
alias -g NO='2&1>/dev/null &'
alias md='mkdir -pv'
alias mnt="rclone mount one:/ ${HOME}/one/ --vfs-cache-mode full &disown"

screenshot() {
	sleep 1;
	grim -g "$(slurp)" /dev/stdout|wl-copy
}
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# autologin to Hyprland
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland &
fi
