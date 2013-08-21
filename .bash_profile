HISTCONTROL=ignoredups

PS1_gitedits() {
	#if [ -d .git ]; then
	#echo "$(git branch 2>/dev/null | sed 's/^ *//' [ -d .git ]) && printf ' #' && git status -s | wc -l | tr -d ' '"
	git branch 2>/dev/null
}
PS1="\e[30;47m\u@\h\$ \e[31;1m\w\033[0;32m `PS1_gitedits` \033[37;0m\e[0m\n"
