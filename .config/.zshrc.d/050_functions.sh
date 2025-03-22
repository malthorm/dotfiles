# CD to a directory, but open it in vim, if it is a file
cd() {
    if [ -f "${1}" ]; then
        vim "${@}"
    else
        builtin cd "${@}"
    fi
}

# make a directory and cd to it
mkcd() {
    if [ ! -d "${1}" ]; then
        mkdir -p "${1}"
    fi
    cd "${1}"
}
#
# make a directory with prefixed date and cd to it
mkcdd() {
    local name
    name="$(date "+%Y_%m_%d")_${1}"
    if [ ! -d "${name}" ]; then
        mkdir -p "${name}"
    fi
    cd "${name}"
}
# Copy current working directory to clipboard AND output it
cwd() {
    pwd | tr -d '\n' | xsel -ib
    pwd
}
