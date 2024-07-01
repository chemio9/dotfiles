proxy_on(){
  [[ -z "$HOST" ]] || local HOST=127.0.0.1
  export HTTP_PROXY=http://${HOST}:1081 HTTPS_PROXY=http://${HOST}:1081 ALL_PROXY=http://${HOST}:1081
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
