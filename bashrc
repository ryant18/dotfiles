export PS1="\[\e[1;31m\][\[\e[m\]\[\e[1;32m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;31m\]]\[\e[m\]\m "

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# edit using vim commands
set -o vi

source ~/.bash_aliases
source /usr/local/bin/virtualenvwrapper.sh
source ~/.fzf.bash

# open terminal to last changed directory
CWDFILE="/home/ryan/.scripts/.cwd.txt"

pathsave() {
  cd $1
  echo $(pwd) > $CWDFILE
}
alias cd='pathsave $1'

if [[ ! -f $CWDFILE  ]]; then
  touch $CWDFILE
  echo "/home/ryan" > $CWDFILE
fi
cd $(cat $CWDFILE)

