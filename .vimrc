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
set number
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
if exists("+autochdir")
	set autochdir
endif

" search config
set ignorecase
set smartcase
set wrapscan

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
nnoremap tt <C-u>:tabnew<cr><Esc>
nnoremap tn gt
nnoremap tp gT

nnoremap j gj
nnoremap k gk

set runtimepath+=~/.vim
