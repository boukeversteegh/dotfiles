HISTCONTROL=ignoredups
dotfiles="${BASH_SOURCE%/*}"

source $dotfiles/.git-prompt.sh
source $dotfiles/.git-completion.bash

PATH="$PATH:$dotfiles/bin"
alias gh=". git-home"

PS1_gitedits() {
	return;
	if [ -d .git ]; then
		echo "";
		git status -s 2> /dev/null | column | awk '{print "\033[32;48;5;235m" $0 "\033[0m"}' | column
	fi;
}

source $dotfiles/.bash-colors

cc() {
  echo -en "\E[6n"
  read -sdR CURPOS
  CURPOS=${CURPOS#*[}
  echo -n $CURPOS
}

PS1="$Blue$On_Black\u@\h\e $Blue$On_Black\t $Color_Off$UCyan$On_Black\w$Color_Off$ICyan$On_Black\$(__git_ps1)$Color_Off\n$ICyan"

# This breaks vagrant debian
# trap "tput sgr0" DEBUG

export LC_ALL="en_US.UTF-8"

#(which npm > /dev/null) && . <(npm completion)
