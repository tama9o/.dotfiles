" encoding
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

" swap file directory
set directory=~/.vim/swap
" backup file directory
set backupdir=~/.vim/backup
" undo file directory
set undodir=~/.vim/undo

" copy to clipboard
set clipboard=unnamed

" show special chars and others.
set relativenumber
set ruler
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set matchpairs& matchpairs=<:>

syntax on

" tab char config
set tabstop=4
set shiftwidth=4
"set expandtab
set noexpandtab

"set autoindent
"set smartindent
set cindent

" set nowrap
set textwidth=0
set wrapmargin=0

" change current dir
"if exists("+autochdir")
"	set autochdir
"endif

" search config
set ignorecase
set smartcase
set wrapscan

" grep
if executable("jvgrep")
	set grepprg=jvgrep\ --enc\ sjic,utf-8
endif

" editing configs
set shiftround
set whichwrap=b,s,h,l,[,],<,>

" other configs
set shellslash

set t_vb=
set novisualbell

set showtabline=2

" for text file
autocmd FileType text setlocal expandtab tabstop=2 shiftwidth=2

" for markdown file
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setlocal filetype=markdown expandtab tabstop=4 shiftwidth=4

" key maps
" nnoremap tt <C-u>:tabnew<cr><Esc>
" nnoremap tn gt
" nnoremap tp gT

nnoremap j gj
nnoremap k gk

nnoremap <C-]> g<C-]>

set runtimepath+=~/.vim


" vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'https://github.com/Shougo/unite.vim.git'
	Plug 'Shougo/vimfiler'
	Plug 'vim-scripts/javacomplete'
call plug#end()

" for vimfiler.
source ~/.vim/pluginrc/vimfiler.vim
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

" for javacomplete
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

