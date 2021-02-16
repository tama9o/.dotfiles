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

# mute bell.
if [ "$OS" = "windows" ]; then
  if ! grep 'bell-style' ~/.inputrc &>/dev/null; then
    echo 'Append bell-style setting to ~/.inputrc'
    echo 'set bell-style none' >>~/.inputrc
  fi
fi

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

#
# Setup tools.
#

[ ! -d ~/bin ] && mkdir ~/bin

if ! which jq &>/dev/null; then
  echo "Setup 'jq'."
  [ "$OS" = "windows" ] && os=win
  curl -sSL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-$os$ARCH$EXT -o ~/bin/jq$EXT
  if [ "$OS" = "linux" ]; then
    chmod u+x ~/bin/jq
  fi
  jq --version
fi

if ! which trdsql &>/dev/null; then
  echo "Setup 'trdsql'."
  curl -sSL "https://github.com/noborus/trdsql/releases/download/v0.7.6/trdsql_v0.7.6_${OS}_${CPU}${ARCH}.zip" -o ~/bin/trdsql.zip
  unzip ~/bin/trdsql.zip -d ~/bin
  mv "$HOME/bin/trdsql_v0.7.6_${OS}_${CPU}${ARCH}/trdsql${EXT}" ~/bin/

  if [ "$OS" = "linux" ]; then
    chmod u+x ~/bin/trdsql
  fi

  rm ~/bin/trdsql.zip
  rm -r "$HOME/bin/trdsql_v0.7.6_${OS}_${CPU}${ARCH}/"
  trdsql --version
fi

if ! which jvgrep &>/dev/null; then
  # jvgrep_v5.8.8_linux_amd64.tar.gz
  # jvgrep_v5.8.8_windows_amd64.zip
  echo "Setup 'jvgrep'."
  ver=v5.8.8

  if [ "$OS" = "windows" ]; then
    url="https://github.com/mattn/jvgrep/releases/download/${ver}/jvgrep_${ver}_${OS}_${CPU}${ARCH}.zip"
    curl -sSL "$url" -o ~/bin/jvgrep.zip
    unzip ~/bin/jvgrep.zip -d ~/bin
    mv "$HOME/bin/jvgrep_${ver}_${OS}_${CPU}${ARCH}/jvgrep${EXT}" ~/bin/

    rm ~/bin/jvgrep.zip
  fi
  # TODO: Test
  if [ "$OS" = "linux" ]; then
    url="https://github.com/mattn/jvgrep/releases/download/${ver}/jvgrep_${ver}_${OS}_${CPU}${ARCH}.tar.gz"
    curl -sSL "$url" -o ~/bin/jvgrep.tar.gz
    tar xzf ~/bin/jvgrep.tar.gz -C ~/bin
    mv "$HOME/bin/jvgrep_${ver}_${OS}_${CPU}${ARCH}/jvgrep${EXT}" ~/bin/

    chmod u+x ~/bin/jvgrep
    rm ~/bin/jvgrep.tar.gz
  fi

  rm -r "$HOME/bin/jvgrep_${ver}_${OS}_${CPU}${ARCH}/"

  jvgrep --version
fi



# make
# sudo
# winmerge
# ctags
