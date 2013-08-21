HISTCONTROL=ignoredups

PS1_gitedits() {
	if [ -d .git ]; then
		echo "";
		git status -s 2> /dev/null | column -x  -s ' ' | column -t | awk '{print "\033[32;48;5;235m" $0 "\033[0m"}'
	fi;
}
PS1="\e[30;47m\u@\h\$\e[48;5;235m \e[31;1m\w\033[0m \$(PS1_gitedits) \033[37;0m\e[0m\n"
