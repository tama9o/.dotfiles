# vim: set ts=2 sw=2 expandtab:
test -f "$HOME/.bashrc.local" && source "$HOME/.bashrc.local"

alias genp='cat /dev/random | tr -dc '\''a-zA-Z0-9!#%&()$@'\'' | fold -w 32 | head'
alias genpa='cat /dev/random | tr -dc '\''a-zA-Z0-9'\'' | fold -w 32 | head'

function changePathLinToWin() {
  path="$(realpath $1)"

  path=${path#/}
  path=${path/\//:\\}
  path=${path//\//\\}
  echo "$path"
}

function open() {
  if which open &>/dev/null; then
    open "$@"
    return
  fi
  path=$(changePathLinToWin "$1")
  explorer.exe "$path"
}
