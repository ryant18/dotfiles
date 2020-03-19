alias configs='vim $(< /home/ryan/.scripts/configs.csv cut -f1 -d "," | fzf | grep -wf - /home/ryan/.scripts/configs.csv | cut -f2 -d "," | xargs)'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias mkvirtualenv="mkvirtualenv --python=python3"
alias weather="curl 'http://wttr.in/'"
