# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'
alias -g G="| grep"
alias -g L="| less"
#Copy with progress-bar
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias Psdash="psdash --log /var/log/myapp.log --log /var/log/mydb.log &"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR="vim"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


#set history for give numbers to the command and it's arguments
# set -H
# set -o history


#Extract Archive
# extract () {
#     if [ -f $1 ] ; then
#         case $1 in
#             *.tar.bz2)        tar xjf $1        ;;
#             *.tar.gz)         tar xzf $1        ;;
#             *.bz2)            bunzip2 $1        ;;
#             *.rar)            unrar x $1        ;;
#             *.gz)             gunzip $1         ;;
#             *.tar)            tar xf $1         ;;
#             *.tbz2)           tar xjf $1        ;;
#             *.tgz)            tar xzf $1        ;;
#             *.zip)            unzip $1          ;;
#             *.Z)              uncompress $1     ;;
#             *)                echo "'$1' cannot be extracted via extract()" ;;
#         esac
#     else
#         echo "'$1' is not a valid file"
#     fi
# }
#

autoload -U promptinit
promptinit

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

#Complete Aliases
setopt completealiases

#Auto-insert 'sudo' at the start of line.
insert_sudo () { zle beginning-of-line; zle -U "sudo ";}
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo


# Insert "sudo " at the beginning of the line
# function prepend-sudo {
#   if [[ $BUFFER != "sudo "* ]]; then
#     BUFFER="sudo $BUFFER"; CURSOR+=5
#   fi
# }
# zle -N prepend-sudo
# bindkey "^[s" insert-sudo

export CDPATH=.:~:/home/sagar/Workspace:/home/sagar/Dropbox/Programs/:

