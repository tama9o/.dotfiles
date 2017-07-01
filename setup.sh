#!/bin/bash
# vim: set ts=2 sw=2 expandtab :

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

curl -fLo $CONFIG_BASE/.vimperator/plugin/tree-style-tab.js --create-dirs \
  https://gist.githubusercontent.com/tama9o/97f573f6d15aae9317260d0346e28b93/raw/f18463fc176515c784eeaec78b588934db040977/tree-style-tab.js

