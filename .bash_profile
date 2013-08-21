HISTCONTROL=ignoredups

PS1_gitedits() {
	#if [ -d .git ]; then
	#echo "$(git branch 2>/dev/null | sed 's/^ *//' [ -d .git ]) && printf ' #' && git status -s | wc -l | tr -d ' '"
	if [ -d .git ]; then
		echo "";
		#echo -e "\033[48;5;235m";
		#git branch 2>/dev/null | sed 's/^* //';
		#echo -ne "\n\033[48;5;235m";
		#x=`echo -e "\033[0m"`;
		git status -s 2> /dev/null | awk '{print "\033[32;48;5;235m" $0 "\033[0m"}'
		#echo -ne "\033[0m";
	fi;
}
PS1="\e[30;47m\u@\h\$\e[48;5;235m \e[31;1m\w\033[0m \$(PS1_gitedits) \033[37;0m\e[0m\n"
