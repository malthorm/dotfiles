function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

if ! zgen saved; then
    zgen load jeffreytse/zsh-vi-mode
fi

