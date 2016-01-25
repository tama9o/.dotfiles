
" swap file directory
set directory=~\root\var\vim\swap
" backup file directory
set backupdir=~\root\var\vim\backup
" undo file directory
set undodir=~\root\var\vim\undo

" copy to clipboard
set clipboard=unnamed

set number

" tab config
set showtabline=2

" tab code config
set tabstop=2
set shiftwidth=2
set expandtab

" set nowrap
set textwidth=0
set wrapmargin=0

" change current dir
set autochdir

set ignorecase
set smartcase

set shiftround


nnoremap tt <C-u>:tabnew<cr><Esc>
nnoremap tn gt
nnoremap tp gT

nnoremap j gj
nnoremap k gk
