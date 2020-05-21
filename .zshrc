PLUGIN_DIR=~/.zsh/plugins

# ==================== PROMPT =================================================
source $PLUGIN_DIR/zsh-vim-mode.zsh
MODE_CURSOR_VIINS="#00ff00 steady bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

MODE_INDICATOR_VIINS='$'
MODE_INDICATOR_VICMD='*'
MODE_INDICATOR_REPLACE='r'
MODE_INDICATOR_SEARCH='s'
MODE_INDICATOR_VISUAL='v'
MODE_INDICATOR_VLINE='vl'

setopt PROMPT_SUBST
PROMPT='%B%F{red}[%F{green}%n%F{cyan}%b@%B%F{green}%M %F{blue}%~%F{red}]%F{gray}%b${MODE_INDICATOR_PROMPT} '


# =================== LOAD PLUGINS ============================================
source /usr/local/bin/virtualenvwrapper.sh
source ~/.fzf.zsh
source $PLUGIN_DIR/colored-man-pages.zsh


# ==================== ALIASES =================================================
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias mkvirtualenv="mkvirtualenv --python=python3"

# open terminal to last changed directory
CWDFILE=~/.zsh/.cwd
cd() {
  builtin cd $1
  echo $(pwd) > $CWDFILE
}

if [[ ! -f $CWDFILE  ]]; then
  touch $CWDFILE
  echo '$HOME' > $CWDFILE
fi
builtin cd $(cat $CWDFILE)

# edit config files
configs() {
  CONFIGFILE=$(< ~/.scripts/configs.csv cut -f1 -d "," | tail -n +2 | fzf --height 25% | grep -wf - ~/.scripts/configs.csv | cut -f2 -d "," | xargs)
  if ! [ -z "$CONFIGFILE" ]; then
    vim $CONFIGFILE
  fi
}

# go to project directory
projects() {
  PROJECTPATH="$HOME/projects/"
  SELPROJECTDIR=$(ls -d $PROJECTPATH*/ | grep -oE "[^/]+/$" | sed 's/.$//' | fzf --height 25%)
  if ! [ -z "$SELPROJECTDIR" ]; then
    cd $PROJECTPATH$SELPROJECTDIR
  fi
}

# dont save some commands in history 
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTORY_IGNORE="(cd *|rm *)"
function zshaddhistory() {
  emulate -L zsh
  setopt extendedglob
  whence ${${(z)1}[1]} >| /dev/null || return 1 
  [[ $1 != ${~HISTORY_IGNORE} ]]
}


# =================== TAB COMPLETE =============================================
source $PLUGIN_DIR/zsh-autosuggestions.zsh
bindkey 'OP' autosuggest-accept

autoload -U +X compinit && compinit #-C

# dont auto select first entry
zstyle ':completion:::*:default' menu no select

# add colors to autocomplete suggestions
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# only show directories for ls
zstyle ':completion:*:ls:*' file-patterns '*(/)'


#zstyle ':completion:*:*:temp:*' tag-order 'commands functions'
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#F1 ^[OP
#F2 ^[OQ
#F3 ^[OR
#F4 ^[OS
#F5 ^[[15~
#F6 ^[[17~
#F7 ^[[18~
#F8 ^[[19~
#F9 ^[[20~
#F10 ^[[21~
#F11 ^[[23~
#F12 ^[[24~
#
