#!/bin/bash

if [ ! `which curl` ]; then
  echo curl command is not exist.
  exit 1
fi

CONFIG_BASE=~/.dotfiles/

touch $CONFIG_BASE/.vim/.vimrc.local

curl -fLo $CONFIG_BASE/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo $CONFIG_BASE/.vim/colors/molokai.vim --create-dirs \
  https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
