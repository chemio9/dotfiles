proxy_on(){
  [[ -n "$HOST" ]] && local HOST=127.0.0.1
  export HTTP_PROXY=http://${HOST}:7890 HTTPS_PROXY=${HOST}:7890 ALL_PROXY=http://${HOST}:7890
}
proxy_off(){ unset HTTP_PROXY HTTPS_PROXY ALL_PROXY }

alias md='mkdir -pv'
alias mnt="rclone mount one:/ ${HOME}/one/ --vfs-cache-mode full &disown"

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if local cwd="$(cat -- "$tmp")" &&  [[ -n "$cwd" ]]  && [[ "$cwd" != "$PWD" ]]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

screenshot() {
	sleep 1;
	grim -g "$(slurp)" /dev/stdout|wl-copy
}
