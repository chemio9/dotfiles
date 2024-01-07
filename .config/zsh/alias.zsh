proxy_on(){ export HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=127.0.0.1:7890 ALL_PROXY=http://127.0.0.1:7890 }
proxy_off(){ unset HTTP_PROXY HTTPS_PROXY ALL_PROXY }

alias md='mkdir -pv'
alias mnt="rclone mount one:/ ${HOME}/one/ --vfs-cache-mode full &disown"

screenshot() {
	sleep 1;
	grim -g "$(slurp)" /dev/stdout|wl-copy
}
