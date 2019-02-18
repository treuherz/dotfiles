bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

bindkey '^[^[OC' forward-word
bindkey '^[^[OD' backward-word

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word
