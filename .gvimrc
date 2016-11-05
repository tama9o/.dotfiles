
scriptencoding utf-8

" font
if has('win32') || has('win64')
  set guifont=Consolas:h10.5
  set guifontwide=MS_Gothic:h10.5

else
  set guifont=Takaoゴシック\ 13
  set guifontwide=Takaoゴシック\ 13
endif

highlight SpecialKey guibg=NONE guifg=#AAAAAA
highlight NonText guibg=NONE guifg=#AAAAAA

" 縦幅 デフォルトは24
set lines=40
" 横幅 デフォルトは80
set columns=150

" disable beep sound
set t_vb=

set guioptions-=T
set guioptions-=m

if filereadable($home . "/.vim/colors/molokai.vim")
  colorscheme molokai
endif

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif

gui
if has('win32') || has('win64')
	set transparency=236
endif
