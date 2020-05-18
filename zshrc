# =================== PLUGIN MANAGER ===========================================
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# =================== LOAD PLUGINS ============================================
zinit load softmoth/zsh-vim-mode


# ==================== PROMPT =================================================
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
PROMPT='%B%F{red}[%F{green}%n@%M %F{blue}%~%F{red}]%F{gray}%b${MODE_INDICATOR_PROMPT} '



# ==================== ALIASES =================================================
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias mkvirtualenv="mkvirtualenv --python=python3"

# open terminal to last changed directory
CWDFILE="$HOME/.scripts/.cwd.txt"
pathsave() {
  cd $1
  echo $(pwd) > $CWDFILE
}
alias cd='pathsave $1'

if [[ ! -f $CWDFILE  ]]; then
  touch $CWDFILE
  echo '~' > $CWDFILE
fi
cd $(cat $CWDFILE)

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






setopt histignorealldups sharehistory
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:::*:default' menu no select

