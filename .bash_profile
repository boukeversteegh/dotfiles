HISTCONTROL=ignoredups

PS1_gitedits() {
	return;
	if [ -d .git ]; then
		echo "";
		git status -s 2> /dev/null | column | awk '{print "\033[32;48;5;235m" $0 "\033[0m"}' | column
	fi;
}
PS1="\e[30;47m\u@\h\$\e[48;5;235m \e[31;1m\w\033[0m\$(__git_ps1)\033[37;0m\e[0m\n"

export LC_ALL="en_US.UTF-8"

(which npm > /dev/null) && . <(npm completion)
