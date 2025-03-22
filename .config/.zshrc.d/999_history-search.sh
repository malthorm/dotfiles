if ! zgen saved; then
    zgen load zsh-users/zsh-history-substring-search zsh-history-substring-search.zsh
fi


setopt HIST_FIND_NO_DUPS

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
bindkey -M vicmd '^[[A' history-substring-search-up 
bindkey -M vicmd '^[OA' history-substring-search-up 
bindkey -M vicmd '^[[B' history-substring-search-down
bindkey -M vicmd '^[OB' history-substring-search-down
bindkey -M viins '^[[A' history-substring-search-up 
bindkey -M viins '^[OA' history-substring-search-up 
bindkey -M viins '^[[B' history-substring-search-down 
bindkey -M viins '^[OB' history-substring-search-down

