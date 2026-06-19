proxy_on(){
  [[ -z "$HOST" ]] || local HOST=localhost
  [[ -z "$PORT" ]] || local HOST=7890
  export HTTP_PROXY=http://${HOST}:$PORT HTTPS_PROXY=http://${HOST}:$PORT ALL_PROXY=http://${HOST}:$PORT
  export http_proxy=http://${HOST}:$PORT https_proxy=http://${HOST}:$PORT all_proxy=http://${HOST}:$PORT
}
proxy_off(){
	unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
	unset http_proxy https_proxy all_proxy
}

# alias mnt="rclone mount one:/ ${HOME}/one/ --vfs-cache-mode full &disown"
alias :q="exit"
alias :w="sync"
alias :x="sync && exit"
alias :wq="sync && exit"

alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias restart="sudo systemctl restart"

alias .="source"
alias cp="cp -i --reflink=auto --sparse=auto"

