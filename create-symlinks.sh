#!/bin/bash
# vim: set ts=2 sw=2 expandtab:

REPODIR=`pwd`
REPODIR=`basename $REPODIR`

ln -sf $REPODIR/.vimrc ../.vimrc
ln -sf $REPODIR/.gvimrc ../.gvimrc
ln -sf $REPODIR/.vim ../.vim

[ -f ../.bashrc -a ! -s ../.bashrc ] \
  && mv ../.bashrc ../.bashrc.local
ln -sf $REPODIR/.bashrc ../.bashrc
