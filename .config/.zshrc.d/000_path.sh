##
# It always needs to be made sure path.sh is loaded first, as other scripts
# depend on it.
##

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export EDITOR="nvim"
export VISUAL="nvim"

path=("$HOME/scripts" "$HOME/.local/bin" "/usr/local/bin" "/usr/local/go/bin" "$HOME/.config/herd-lite/bin" $path)
export PATH
export PATH=$PATH:/home/malthor/.spicetify
