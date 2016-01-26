@echo off

for %%I in (.) do set REPODIR=%%~nI%%~xI

mklink ..\.vimrc %REPODIR%\.vimrc
mklink ..\.gvimrc %REPODIR%\.gvimrc
mklink ..\.vimperatorrc %REPODIR%\.vimperatorrc
mklink /D ..\.vim %REPODIR%\.vim

