bindkey -e

#########
# ZPLUG #
#########

export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh

zplug "~/.config/zsh/history", from:local
zplug "~/.config/zsh/keybindings-osx", from:local, \
    if:"[[ $OSTYPE == *darwin* ]]"
zplug "~/.config/zsh/keybindings-linux", from:local, \
    if:"[[ $OSTYPE == *linux* ]]"
zplug "~/.config/zsh/keybindings", from:local
zplug "~/.config/zsh/completion", from:local
zplug "zsh-users/zsh-completions"
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search", on:"zsh-users/zsh-syntax-highlighting"
zplug "agnoster/agnoster-zsh-theme", as:theme

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load


source $HOME/.zlocal
###########
# OPTIONS #
###########
setopt autocd # if a directory is sent instead of a command, cd to it


###########
# ALIASES #
###########

# Wraps mc so that it exits to the directory I'm looking at.
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

alias dk=docker
alias dkr="docker run"
alias dkb="docker build"
alias dkm=docker-machine
alias dkc=docker-compose


alias kc=kubectl

alias cg='cd $(git rev-parse --show-toplevel)'

cdr() {
  tmpfile="/tmp/ranger-dir"
  ranger --choosedir=$tmpfile $argv
  rangerdir=$(cat $tmpfile)
  if [[ $PWD != $rangerdir ]]; then
    cd $rangerdir
    unset rangerdir
  fi
}

alias rr=ranger

if type thefuck > /dev/null; then
  eval $(thefuck --alias damn)
fi

if [[ -e /usr/local/share/z/z.sh ]]; then
  source /usr/local/share/z/z.sh
fi

if [[ -e $HOME/.cargo/env ]]; then
  source $HOME/.cargo/env
fi

# Load pyenv automatically by appending
# the following to ~/.zshrc:

if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

if (( $+commands[go] )); then
  export PATH=$(go env GOPATH)/bin:$PATH
fi

export WORDCHARS=${WORDCHARS/\/}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/nomad nomad

