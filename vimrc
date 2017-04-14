set nocompatible              " be iMprovke, required
filetype off                  " required

"=== Pull in Plugins File ==="

so ~/.vim/vimplugins.vim


syntax enable

set backspace=indent,eol,start           "make backspace behave as it does in other editors"
set number                               "show line numbers in files"

"======= APPEARANCE ==="

colorscheme atom-dark-256
set guioptions-=r
set guioptions-=L
set guioptions-=r
set guioptions-=R

set linespace=25

"======= SCREEN MANAGEMENT ==="

set splitright                         "default create new split to the right of the current buffer"
nmap <C-H> <C-W><C-H>                  
nmap <C-L> <C-W><C-L>

"======= SEARCH  ======"

set hlsearch                            "highlight search results"
set incsearch                           "incrementally highlight search results"

"=======  MAPPINGS  ==="


"make editing vimrc easier"
nmap ,ev :e ~/.vimrc<cr>

"unhighlight search results"
nmap ,<space> :nohlsearch<cr>           

"=======  AUTO-COMMANDS ====="

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END  
