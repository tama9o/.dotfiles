#!/bin/bash
# vim: set ts=2 sw=2 expandtab :

if [ ! `which curl` ]; then
  echo curl command is not exist.
  exit 1
fi

case $(uname -a) in
  MINGW*)
    OS=windows
    EXT=.exe
    ;;
  Linux*)
    OS=linux
    EXT=
    ;;
  *)
    OS=
    EXT=
    ;;
esac
case $(uname -a) in
  *x86_64*)
    CPU=amd
    ARCH=64
    ;;
  *)
    CPU=
    ARCH=
    ;;
esac
if [ -z "$OS" -o -z "$CPU" -o -z "$ARCH" ]; then
  echo "Cannot specify environment." >&2
  echo -e "\tOS=$OS, CPU=$CPU, ARCH=$ARCH" >&2
  exit 1
fi
echo "$OS-$CPU$ARCH"
echo


CONFIG_BASE=~/.dotfiles/

touch $CONFIG_BASE/.vim/.vimrc.local

#
# Setup Vim.
#

[ ! -f $CONFIG_BASE/.vim/autoload/plug.vim ] &&
  curl -sSLo $CONFIG_BASE/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
[ ! -f $CONFIG_BASE/.vim/colors/molokai.vim ] &&
  curl -sSLo $CONFIG_BASE/.vim/colors/molokai.vim --create-dirs \
    https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

#
# Setup bash.
#

if [ ! -f ~/.bash_profile ]; then
  echo Create ~/.bash_profile
  cat <<'EOF' >~/.bash_profile
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

cd ~

alias ll="ls -l"
alias la="ls -al"

EOF
  if [ "$OS" = "windows" ]; then
    cat <<'EOF' >>~/.bash_profile

function update_path {
    local IFS=:

    new_path=
    for l in $PATH; do
        [[ $l =~ NVIDIA ]] && continue
        [[ $l =~ PowerShell ]] && continue
        [[ $l =~ System32 ]] && continue
        [[ $l =~ system32 ]] && continue
        new_path="$new_path:$l"
    done

    export PATH="$new_path"
}

update_path
EOF
  fi

  source ~/.bash_profile
fi

if [[ ! "$PATH" =~ .*$HOME/bin.* ]]; then
  cat <<'EOF' >>~/.bash_profile

export PATH=$PATH:~/bin
EOF
  export PATH=$PATH:~/bin
fi

if [ -z "$(grep -F 'genpa' ~/.bashrc 2>/dev/null)" ]; then
  cat <<'EOF' >>~/.bashrc

alias genp='cat /dev/random | tr -dc '\''a-zA-Z0-9!#%&()$@'\'' | fold -w 32 | head'
alias genpa='cat /dev/random | tr -dc '\''a-zA-Z0-9'\'' | fold -w 32 | head'
EOF
  source ~/.bashrc
fi

#
# Setup tools.
#

[ ! -d ~/bin ] && mkdir ~/bin

echo "Setup 'jq'."
if [ ! which jq &>/dev/null ]; then
  [ "$OS" = "windows" ] && os=win
  curl -sSL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-$os$ARCH$EXT -o ~/bin/jq$EXT
  if [ "$OS" = "linux" ]; then
    chmod u+x ~/bin/jq
  fi
fi
jq --version

echo "Setup 'trdsql'."
if [ ! which trdsql &>/dev/null ]; then
  curl -sSL "https://github.com/noborus/trdsql/releases/download/v0.7.6/trdsql_v0.7.6_$OS_$CPU$ARCH.zip" -o ~/bin/trdsql.zip
  unzip ~/bin/trdsql.zip -d ~/bin
  mv "~/bin/trdsql_v0.7.6_$OS_$CPU$ARCH/trdsql$EXT" ~/bin/

  if [ "$OS" = "linux" ]; then
    chmod u+x ~/bin/trdsql
  fi
fi
trdsql --version

# make
# sudo
# winmerge

