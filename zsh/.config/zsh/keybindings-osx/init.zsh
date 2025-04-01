bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey '^[^[[C' forward-word
# bindkey '^[^[[D' backward-word

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word
