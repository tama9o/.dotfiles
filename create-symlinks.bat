@echo off

for %%I in (.) do set REPODIR=%%~nI%%~xI

mklink ..\.vimrc %REPODIR%\.vimrc
mklink ..\.gvimrc %REPODIR%\.gvimrc
mklink /D ..\.vim %REPODIR%\.vim

dir ..\.bashrc | findstr "<SYMLINK>" >nul
if errorlevel 1 move ..\.bashrc ..\.bashrc.local
mklink ..\.bashrc %REPODIR%\.bashrc

