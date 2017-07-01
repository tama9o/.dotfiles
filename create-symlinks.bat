@echo off

for %%I in (.) do set REPODIR=%%~nI%%~xI

mklink ..\.vimrc %REPODIR%\.vimrc
mklink ..\.gvimrc %REPODIR%\.gvimrc
mklink /D ..\.vim %REPODIR%\.vim

mklink ..\.vimperatorrc %REPODIR%\.vimperatorrc
mklink /D ..\vimperator %REPODIR%\.vimperator

