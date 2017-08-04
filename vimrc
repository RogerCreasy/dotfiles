set nocompatible              " be iMprovke, required
filetype off                  " required

"=== Pull in Plugins File ==="

so ~/.vim/vimplugins.vim


syntax enable

set backspace=indent,eol,start           "make backspace behave as it does in other editors"
set number                               "show line numbers in files"

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set title           " show filename in window titlebar

set autoread        " auto check for file changes

nmap <Tab> :bnext<cr>
nmap <S-Tab> :bprevious<cr>

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

    "---- PHPCS ----"
    let g:phpqa_codesniffer_args = "--standard=PSR2"

    "---- Syntastic ----"
    let g:syntastic_php_checkers = ['php', 'phpcs']
    let g:syntastic_php_phpcs_args = "--standard=PSR2 -n"

    let php_sql_query=1
    let php_htmlInStrings=1
    let php_noShortTags=1
    let php_folding=0
    let php_baselib=1
    let php_asp_tags=0
    let php_parent_error_close=1
    let php_parent_error_open=1
    "let php_sync_method=10  " Sync only 10 lines backwards
    "let php_alt_comparisons=1
    "let php_alt_assignByReference=1

    "---- PHPFMT ----"
    let g:phpfmt_standard = 'PSR2'

    "=======  MAPPINGS  ==="

"make editing vimrc easier"
nmap ,ev :e ~/.vimrc<cr>

"edit snippets
nmap ,es :e ~/.vim/snippets/

" write, then close the buffer
nmap ,wbd :w<cr> :bd<cr>

"unhighlight search results"
nmap ,<space> :nohlsearch<cr>           

"simplify NERDTree; set CTR-1 to toggle it"
nmap 1 :NERDTreeToggle<cr>

"manage ctr-P (plugin)"
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-f> :CtrlPMRUFiles<cr>
nmap ,bt :bufdo tab split<CR>
let g:ctrlp_custom_ignore = 'node_modules\|git'


"---- Laravel-Specific ----"
nmap ,l4r :e app/Http/routes.php<cr>
nmap ,lr :e routes/web.php<cr>
nmap ,lm !php artisan make:
nmap ,lc :CtrlP app/Http/Controllers/<cr>
nmap ,lv :CtrlP resources/views/<cr>

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
