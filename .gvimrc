
scriptencoding utf-8

" font
if has('win32') || has('win64')
  set guifont=MS_Gothic:h10
  set guifontwide=MS_Gothic:h10
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

