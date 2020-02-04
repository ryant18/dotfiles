cdw() {
  cd $1
  echo $(pwd) > "/home/ryan/.scripts/cwd.txt"
}
alias cd='cdw $1'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias mkvirtualenv="mkvirtualenv --python=python3"
alias weather="curl 'http://wttr.in/'"
