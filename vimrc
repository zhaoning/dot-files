" Basic file type
filetype plugin indent on
syntax enable

" Split window behaviours
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Canvas
set number
set relativenumber
set cursorline
set colorcolumn=80
set nostartofline
set nowrap

" Auto completion
set wildmenu

" Brackets matching
set showmatch

" Search
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<cr>

" Open help in a vertical split
cabbrev vh vert<space>h

" Fast access to vimrc
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Spacing
set expandtab
set tabstop=4
set shiftwidth=4

" Remove trailing spaces
nnoremap <leader>rt :%s/\s\+$//<cr>

" Colour theme
packadd! onedark.vim
colorscheme onedark

" Quickfix and location list
nnoremap ]c :cnext<cr>
nnoremap [c :cprev<cr>
nnoremap ]v :lnext<cr>
nnoremap [v :lprev<cr>

" Buffer switching
nnoremap <leader>b :ls<cr>:b<space>

" Beancount
augroup beancount_file
    au!

    " Shift width
    au FileType beancount setl shiftwidth=2
    au FileType beancount setl textwidth=0

    " Root Beancount file
    au FileType beancount let b:beancount_root = '~/bean/ktulu.bean'

    " Go to root Beancount file
    au FileType beancount nnoremap <buffer> <localleader>m
                            \ :e ~/bean/ktulu.bean<cr>

    " Get context
    au FileType beancount nnoremap <buffer> <localleader>c
                            \ :GetContext<cr>

    " Clear transaction
    au FileType beancount nnoremap <buffer> <localleader>x
                \ 0f!r*
augroup end

" Vimwiki
let w2 = {}
let w2.name = 'Personal'
let w2.path = '~/wiki/nz'
let w2.path_html = '~/wiki/nz_html'
let w2.diary_caption_level = 1
let w2.auto_diary_index = 1
let w2.automatic_nested_syntaxes = 1
let w2.auto_tags = 1

let g:vimwiki_list = [w2]
let g:vimwiki_folding = 'expr'

augroup vimwiki_group
    au!

    " No wrap
    au FileType vimwiki :set nowrap

    " Key clashes with macOS
    au FileType vimwiki nnoremap <c-c> :VimwikiToggleListItem<cr>

    " Abbreviations
    au FileType vimwiki :cabbrev gtl VimwikiGenerateTagLinks
    au FileType vimwiki :cabbrev toc VimwikiTOC
    au FileType vimwiki :cabbrev html Vimwiki2HTML

    " Run code block
    au FileType vimwiki nnoremap <buffer> <localleader>v :VikiRunEcho<cr>
    au FileType vimwiki nnoremap <buffer> <localleader>V :VikiRunReplace<cr>
    au FileType vimwiki nnoremap <buffer> <localleader><C-v> :VikiRunQf<cr>

    " Shortcut
    au FileType vimwiki nnoremap <buffer> <localleader>q
                \ o{{{bean-query -q ~/bean/ktulu.bean<cr>}}}<esc>O

augroup end
