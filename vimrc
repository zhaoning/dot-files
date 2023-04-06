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

" Colour theme
packadd! onedark.vim
colorscheme onedark

