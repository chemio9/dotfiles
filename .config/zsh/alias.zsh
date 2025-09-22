proxy_on(){
  [[ -z "$1" ]] && local HOST=127.0.0.1 || HOST=$1
  export HTTP_PROXY=http://${HOST}:7890 HTTPS_PROXY=http://${HOST}:7890 ALL_PROXY=http://${HOST}:7890
}
proxy_off(){ unset HTTP_PROXY HTTPS_PROXY ALL_PROXY }

alias md='mkdir -pv'
alias mnt="rclone mount one:/ ${HOME}/one/ --vfs-cache-mode full &disown"

# Change Yazi's CWD to PWD on subshell exit
if [[ -n "$YAZI_ID" ]]; then
	function _yazi_cd() {
		ya pub dds-cd --str "$PWD"
	}
	add-zsh-hook zshexit _yazi_cd
fi
