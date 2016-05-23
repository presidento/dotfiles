" Display (relative) line numbers
set number
set relativenumber

" Forget about rows.
imap <UP>    <NOP>
imap <Down>  <NOP>
imap <Right> <NOP>
imap <Left>  <NOP>
" activate visual mode in normal mode
nmap <Up>    <NOP>
nmap <Down>  <NOP>
nmap <Right> <NOP>
nmap <Left>  <NOP>
" these are mapped in visual mode
vmap <Up>    <NOP>
vmap <Down>  <NOP>
vmap <Right> <NOP>
vmap <Left>  <NOP>

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

" Automatic indentation
set autoindent
set smartindent

" Enable mouse usage (scroll, etc)
set mouse=a

" Use Q to repeat the 'q' macro
map Q @q

" Wrap lines at word boundaries, not at characters
set linebreak

" Switch on syntax highlighting
syntax on
:
" Show current line and column numbers
set ruler

" Always keep 5 lines visible on the top and the bottom when scrolling
set scrolloff=5

" Always highlight tabs and trailing spaces.
set list
set listchars=tab:>\ ,trail:.,nbsp:.

" Trailing spaces to be highlighted in red.
highlight WhitespaceEOL term=reverse ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Highlight current line of cursor
highlight CursorLine term=underline cterm=underline
set cursorline!

" Ctrl+o will open explorer in a new tab
nnoremap <C-o> :Texplore<CR>

" Set default view mode for explorer to tree
let g:netrw_liststyle=3

" Make explorer hide Vim's swap files
let g:netrw_list_hide='.*\.swp$'

" Cut, copy and paste between Vim and system clipboard
vnoremap <C-c> "+y
vnoremap <C-x> "+d
inoremap <C-v> <Esc>:set paste<CR>"+p:set nopaste<CR>i

" Use Ctrl+Up/Down to scroll 1 line
noremap <C-Up> <C-Y>
noremap <C-Down> <C-E>

" Comment/Uncomment lines of code when pressing Ctrl+E or Ctrl+U
autocmd BufEnter *                              let b:cmt_leader = '# '
autocmd BufEnter *                              let b:cmt_tail = ''
autocmd BufEnter *.c,*.h,*.css                  let b:cmt_leader = '/* '
autocmd BufEnter *.c,*.h,*.css                  let b:cmt_tail = ' */'
autocmd BufEnter *.html,*.htm,*.tpl             let b:cmt_leader = '<!-- '
autocmd BufEnter *.html,*.htm,*.tpl             let b:cmt_tail = ' -->'
autocmd BufEnter *.hpp,*.cpp,*.java,*.php,*.js  let b:cmt_leader = '// '
autocmd BufEnter *.sh,*.ruby,*.python           let b:cmt_leader = '# '
autocmd BufEnter *.mail                         let b:cmt_leader = '> '
autocmd BufEnter *.vim*                         let b:cmt_leader = '" '
noremap <silent> <C-M> :<C-B>silent <C-E>s/^\( *\)\(.*\)$/\1<C-R>=escape(b:cmt_leader,'\/')<CR>\2<C-R>=escape(b:cmt_tail,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <C-U> :<C-B>silent <C-E>s/^\( *\)<C-R>=escape(b:cmt_leader,'\/*')<CR>\(.*\)<C-R>=escape(b:cmt_tail,'\/*')<CR>$/\1\2/e<CR>:nohlsearch<CR>

" Use tabs in Makefiles, spaces in anything else for indentation
function! ToggleTabExpansion()
    if empty(matchstr(expand('%'), '\(^\|/\)\(\([Mm]akefile\(\.am\)\?\)\|\(debian/rules\)\)$'))
        set expandtab
    else
        set noexpandtab
    endif
endfunction
autocmd BufNewFile,BufRead * exec ToggleTabExpansion()

" Highlight Python double quotes
function! HighlightDoubleQuotes()
    syn region pyDoubleQuotes start=/\v"/ skip=/\v\\./ end=/\v"/
    hi def link pyDoubleQuotes Error
endfunction
autocmd Syntax python call HighlightDoubleQuotes()

" Add special binding for Esc to quit in read-only mode
function! ExitWithEscapeInReadonlyMode()
    if &readonly
        nnoremap <Esc> :quit!<CR>
    endif
endfunction
autocmd VimEnter * call ExitWithEscapeInReadonlyMode()

" YAML filetype for Salt's state and pillar files
autocmd BufNewFile,BufRead *.sls   set filetype=yaml shiftwidth=2 tabstop=2 expandtab
