" Display (relative) line numbers
set number
set relativenumber

" Select text with shift + arrow keys
" activate visual mode in inserting mode
imap <S-UP> <Esc>vk
imap <S-Down> <Esc>vj
imap <S-Right> <Esc>vl
imap <S-Left> <Esc>vh
" activate visual mode in normal mode
nmap <S-Up> vk
nmap <S-Down> vj
nmap <S-Right> vl
nmap <S-Left> vh
" these are mapped in visual mode
vmap <S-Up> k
vmap <S-Down> j
vmap <S-Right> l
vmap <S-Left> h

" jump to first non-whitespace on line using HOME
nmap <Home> ^
imap <Home> <Esc>^i
vmap <Home> ^

set tabstop=4 shiftwidth=4 expandtab

" Git line length
au FileType gitcommit set textwidth=60

" Visual search: highlight all occurences
set hlsearch
" Incremental search: show next occurence immediately while you type the search string
set incsearch

" Enable mouse usage (scroll, etc)
set mouse=a

" Use Q to repeat the 'q' macro
map Q @q

" Wrap lines at word boundaries, not at characters
set linebreak

" Switch on syntax highlighting
syntax on
