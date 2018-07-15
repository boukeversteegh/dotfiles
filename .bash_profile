export HISTCONTROL=ignoredups
export HISTFILESIZE=
export HISTSIZE=

dotfiles="${BASH_SOURCE%/*}"

source $dotfiles/.git-prompt.sh
source $dotfiles/.git-completion.bash

PATH="$PATH:$dotfiles/bin"

# ls colors
if ls --color -d / >/dev/null 2>&1; then
    alias ls="ls --color=auto"
else
    alias ls="ls -G"
fi

alias ll="ls -lah"

source $dotfiles/.bash-colors

cc() {
  echo -en "\E[6n"
  read -sdR CURPOS
  CURPOS=${CURPOS#*[}
  echo -n $CURPOS
}

# Prompt color
PS1="$Blue$On_Black\u@\h\e $Blue$On_Black\t $Color_Off$UCyan$On_Black\w$Color_Off$ICyan$On_Black\$(__git_ps1)$Color_Off\n$ICyan"

# This breaks vagrant debian
# trap "tput sgr0" DEBUG

export LC_ALL="en_US.UTF-8"

#(which npm > /dev/null) && . <(npm completion)
