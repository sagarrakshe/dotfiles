# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export VI_SERVER="foo"
export EDITOR="vim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# function gvim() { (/usr/bin/gvim -f "$@" &) }

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias Install="sudo apt-get install $@"
alias sz=". ~/.zshrc"
alias tailf="tail -f"
alias ez="vim ~/.zshrc"
alias ack='ack-grep'
alias ncm='ncmpcpp'
alias gspp='git stash && git pull && git stash pop'
alias fuck='sudo $(fc -ln -1)'
# alias gvim='UBUNTU_MENUPROXY= gvim'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/sagar/bin:/home/sagar/.scripts/"

# NPM_PACKAGES="${HOME}/.npm_packages"
# NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#
# PATH="$NPM_PACKAGES/bin:/home/sagar/local/bin:/home/sagar/local/usr/bin:/home/sagar/racket/bin:$PATH"
#
# export MANPATH="/usr/local/man:$NPM_PACKAGES/share/man:$MANPATH"
#

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# cd () {
#     builtin cd "$@"
#     case $PWD in
#       /home/sagar/workspace/industrial | /home/sagar/Zlemma\
#       | /home/sagar/workspace/codecombat | /home/sagar/workspace/QuodeIt)
#           source bin/activate ;;
#     esac
# }

# Set the name of vim session the terminal is tied up to
eset(){
    export VI_SERVER=$1
}

# Fire up a new server according to the argument supplied
vs(){
    set $*
    vim --servername $1
}

# Open up the files in the environment Vim server.
v(){
    set $*
    vim --servername $1 --remote-silent $2
}

gvs(){
    set $*
    gvim --servername $1
}

# gv(){
#     set $*
#     gvim --servername $1 --remote-silent $2
# }

# Reuse Vim ZSH completions for vim completions
compdef _vim es

#start tmux on startup
if [ -z $TMUX ]
then
  tmux
fi

# map left_alt key to escape key
# xmodmap -e "keycode 108 = Escape"

# vim bindings to zle
bindkey -v

set -o emacs

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# function zle-line-init zle-keymap-select {
#   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#   zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1     # reduce teh delay to 0.1s

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sagar/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sagar/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sagar/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sagar/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gvm config
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#compdef pipenv
_pipenv() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
if [[ "$(basename ${(%):-%x})" != "_pipenv" ]]; then
  autoload -U compinit && compinit
  compdef _pipenv pipenv
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
