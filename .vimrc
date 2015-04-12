""""""""""""""""""""""""""""""""""""""""""
" Custom Configuration
""""""""""""""""""""""""""""""""""""""""""

" line numbers
set number

" auto-indent by 4 spaces
set shiftwidth=4
set softtabstop=4

" replace tab with spaces, except for makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" try to space out to last used indentation mark
set autoindent

" set backup directory and use it for swap files
set backupdir^=~/.backup
set dir^=~/.backup//

" ignore case when searching
set ignorecase

" turn off error beep sound
set vb

" display character ruler on bottom of window
set ruler
