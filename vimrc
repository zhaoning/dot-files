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

" Remove trailing spaces
nnoremap <leader>rt :%s/\s\+$//<cr>

" Colour theme
packadd! onedark.vim
colorscheme onedark

" Quickfix
nnoremap ]c :cnext<cr>
nnoremap [c :cprev<cr>

" Ledger
let g:ledger_is_hledger = v:false
let g:ledger_align_at = 50
let g:ledger_align_commodity = 1
let g:ledger_default_commodity = 'AUD'
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = ' '
augroup ledger_file
        au!

        " Go to main ledger file
        au FileType ledger nnoremap <buffer> <localleader>m
                                \ :e ~/ledger/ktulu.ledger<cr>

        " Autocompletion and align
        au FileType ledger inoremap <silent> <buffer> <tab>
                                \ <C-r>=ledger#autocomplete_and_align()<cr>

        " Status toggle - transaction
        au FileType ledger nnoremap <buffer> <localleader>x
                                \ :call ledger#transaction_state_toggle
                                \ (line('.'), ' *!')<cr>

        " Status toggle - posting
        au FileType ledger nnoremap <buffer> <localleader>p
                                \ :call ledger#transaction_post_state_toggle
                                \ (line('.'), ' *!')<cr>

        " Use quickfix commands in reconciliation
        au FileType ledger nnoremap <buffer> <C-N> :cnext<cr>
        au FileType ledger nnoremap <buffer> <C-P> :cprev<cr>

        " Balance of current account
        au FileType ledger nnoremap <buffer> <localleader>b :Balance<cr>

        " Sort transactions
        au FileType ledger nnoremap <buffer> <localleader>st
                                \ :%!ledger -f - print --sort d<cr>

        " Validity check
        au FileType ledger nnoremap <buffer> <localleader>v
                                \ :silent make\|redraw!\|cwindow<cr>

        " Run reports from a comment line
        au FileType ledger nnoremap <buffer> <localleader>rr
                                \ 0wvg_y:@"<cr>

augroup end

" Beancount
augroup beancount_file
        au!

        " Shift width
        au FileType beancount setl shiftwidth=4

        " Root Beancount file
        au FileType beancount let b:beancount_root = '~/bean/ktulu.bean'

        " Go to root Beancount file
        au FileType beancount nnoremap <buffer> <localleader>m
                                \ :e ~/bean/ktulu.bean<cr>

        " Auto alignment
        au FileType beancount inoremap <buffer> .
                                \ .<C-\><C-O>:AlignCommodity<cr>
        au FileType beancount nnoremap <buffer> <localleader>=
                                \ :AlignCommodity<cr>
        au FileType beancount vnoremap <buffer> <localleader>=
                                \ :AlignCommodity<cr>

        " Get context
        au FileType beancount nnoremap <buffer> <localleader>c
                                \ :GetContext<cr>

        " Use quickfix commands in reconciliation
        au FileType beancount nnoremap <buffer> <C-N> :cnext<cr>
        au FileType beancount nnoremap <buffer> <C-P> :cprev<cr>

augroup end
