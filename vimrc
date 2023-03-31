" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" Plugin 'gmarik/Vundle.vim'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'sjl/badwolf'
" Plugin 'vim-airline/vim-airline'
" 
" call vundle#end()
filetype plugin indent on

syntax enable

colorscheme badwolf

set splitbelow
set splitright

set number
set relativenumber

set cursorline
set colorcolumn=80

set wildmenu
set showmatch
set hlsearch
set incsearch

nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ez :e ~/.zshrc<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set expandtab
set tabstop=4

