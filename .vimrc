" encoding
set fileencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

" swap setting
set noswapfile
" set directory=~/.vim/swap
" backup file directory
set backupdir=~/.vim/backup
" undo file directory
set undodir=~/.vim/undo

" copy to clipboard
set clipboard=unnamed

" show special chars and others.
set cursorline
set number
set relativenumber
set ruler
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set matchpairs+=<:>

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
" for mail file
autocmd FileType mail setlocal expandtab tabstop=2 shiftwidth=2
" for cpp file
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4
" for yaml file
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2
" for json file
autocmd Filetype json let g:indentLine_enabled = 0

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

if filereadable(expand("~/.vim/.local.vimrc"))
	source ~/.vim/.local.vimrc
endif

" vim-plug
call plug#begin('~/.vim/plugged')
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'https://github.com/Shougo/unite.vim.git'
	Plug 'Shougo/vimfiler'
	Plug 'Yggdroot/indentLine'
	Plug 'fatih/vim-go'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'lambdalisue/gina.vim'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'

	Plug 'ryanolsonx/vim-lsp-python'
call plug#end()

" for vimfiler.
source ~/.vim/pluginrc/vimfiler.vim
noremap <C-X><C-F> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

noremap <C-X><C-T> :!ctags -R<ENTER>

" for vim-lsp
" python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if filereadable(expand("~/.vim/colors/molokai.vim"))
  colorscheme molokai
endif
