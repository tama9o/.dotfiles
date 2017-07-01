#!/bin/bash

REPODIR=`pwd`
REPODIR=`basename $REPODIR`

ln -sf $REPODIR/.vimrc ../.vimrc
ln -sf $REPODIR/.gvimrc ../.gvimrc
ln -sf $REPODIR/.vim ../.vim

ln -sf $REPODIR/.vimperatorrc ../.vimperatorrc
ln -sf $REPODIR/.vimperator ../.vimperator

