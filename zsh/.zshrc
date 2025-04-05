# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -e

############
# ANTIDOTE #
############

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

########
# PATH #
########

export PATH=$HOME/.local/bin:/usr/local/sbin:$PATH

###########
# OPTIONS #
###########

setopt autocd # if a directory is sent instead of a command, cd to it
setopt interactivecomments # make # work for comments on the command line

###########
# ALIASES #
###########

alias dk=docker
alias dkr="docker run"
alias dkb="docker build"
alias dkc="docker compose"

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

if (( $+commands[go] )); then
  export PATH=$(go env GOPATH)/bin:$PATH
fi

export WORDCHARS=${WORDCHARS/\/}

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
autoload -U +X bashcompinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
  bashcompinit
done
compinit -C
bashcompinit -C

##fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/et/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

complete -o nospace -C /usr/local/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(mise activate zsh)"

source $HOME/.zlocal
