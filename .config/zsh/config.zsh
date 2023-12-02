setopt INTERACTIVE_COMMENTS
setopt AUTOCD
setopt EXTENDED_GLOB
#setopt GLOBCOMPLETE
setopt COMPLETE_IN_WORD
setopt CORRECT

# history {{{
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$ZDOTDIR/.zhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# }}}

zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#colorred completion menus
eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
bindkey -e

sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
	zle end-of-line
}
zle -N sudo-command-line
#use <Esc><Esc> to add sudo
bindkey "\e\e" sudo-command-line
