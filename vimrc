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

"======= PLUGINS ====="
"
    "---- NERDTREE ----"
    let NERDTreeHijackNetrw = 0


    "---- greplace---"
    set grepprg=ag
    let g:grep_cmd_opts = '--line-numbers --noheading'

"=======  MAPPINGS  ==="

"make editing vimrc easier"


"unhighlight search results"
nmap ,<space> :nohlsearch<cr>           

"simplify NERDTree; set CTR-1 to toggle it"
nmap 1 :NERDTreeToggle<cr>

"manage ctr-P (plugin)"
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-f> :CtrlPMRUFiles<cr>
nmap ,bt :bufdo tab split<CR>

"=======  AUTO-COMMANDS ====="

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END 

"====== Notes/Tips ======="
"
" zz - center cursor location on screen
" ctrl-} - find the method definition of the method called at the cursor location
" ,bt - place the current buffer in a tab
" gt - next tab
" di' - delete inside ' ' (' can be replaced with }]) etc)
" vsp - vertical split
