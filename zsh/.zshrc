# ZPLUG BEGIN
source ~/.zplug/init.zsh

zplug "~/.config/zsh/history", from:local
zplug "zsh-users/zsh-completions"
zplug "srijanshetty/zsh-pip-completion"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "agnoster/3712874", from:gist, as:theme
zplug "~/.config/zsh/keybindings", from:local

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

if type go > /dev/null; then
  export GOPATH="$HOME/go"
  export PATH="$(go env GOPATH)/bin:$PATH"
fi
# Cargo packages
CARGO_BIN="$HOME/.cargo/bin/"
if [[ -d $CARGO_BIN ]] \
  && [[ "$(ls -A $CARGO_BIN)" ]]; then
  export PATH="$CARGO_BIN:$PATH"
fi
# Yarn packages
if type yarn > /dev/null; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

export XDG_CONFIG_HOME="$HOME/.config"

# Wraps mc so that it exits to the directory I'm looking at.
alias mc='. /usr/share/mc/bin/mc-wrapper.sh'

alias dk=docker
alias dkr="docker run"
alias dkb="docker build"
alias dkm=docker-machine
alias dkc=docker-compose

alias bfg='java -jar /usr/lib/bfg-1.12.15.jar'

alias cg='cd $(git rev-parse --show-toplevel)'

export LESS='-i -M -R'
export EDITOR='nvim'

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

if type kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi

if [[ -e /usr/local/share/z/z.sh ]]; then
  source /usr/local/share/z/z.sh
fi

export DEFAULT_USER=`id -un`
