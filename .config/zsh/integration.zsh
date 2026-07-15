# Change Yazi's CWD to PWD on subshell exit
if [[ -n "$YAZI_ID" ]]; then
	function _yazi_cd() {
		ya pub dds-cd --str "$PWD"
	}
	add-zsh-hook zshexit _yazi_cd
fi

[[ ! -f /usr/bin/fvm ]] || {
	export FVM_FLUTTER_URL="https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"

	export PUB_HOSTED_URL="https://pub.flutter-io.cn"
	export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
	export FLUTTER_GIT_URL="https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"
	export CHROME_EXECUTABLE=chromium

}
[[ ! -f /usr/bin/zoxide ]] || eval "$(zoxide init zsh)"
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
