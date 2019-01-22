set nocompatible              " be iMprovke, required
filetype off                  " required

filetype plugin on

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

let mapleader = "," " set leader to ,

"======= APPEARANCE ==="

colorscheme atom-dark-256
"set guioptions-=r
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guifont=Monospace\ 12
set linespace=30

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
"    let g:phpqa_codesniffer_args = "--standard=PSR2"
"    Don't run messdetector on save (default = 1)
     let g:phpqa_messdetector_autorun = 0

    "---- Syntastic ----"
    let g:syntastic_php_checkers = ['php', 'phpcs']
"    let g:syntastic_php_phpcs_args = "--standard=PSR2 -n"
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1

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

    " PHP CS Fixer
    let g:php_cs_fixer_rules = "@PSR2"                " options: --rules (default:@PSR2)
    let g:php_cs_fixer_php_path = "/usr/bin/php"      " Path to PHP
    let g:php_cs_fixer_enable_default_mapping = 0     " Enable the mapping by default (<leader>pcd)
    let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
    let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

    "---- Ultisnip ----"
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsSnippetDirectories=["UltiSnips"]
    "

    "=======  MAPPINGS  ==="

"make editing vimrc easier"
nmap <leader>ev :e ~/.vimrc<cr>

"edit aliases
nmap <leader>ea :e ~/dotfiles/aliases<cr>

"edit plugins
nmap <leader>ep :e ~/.vim/vimplugins.vim<cr>

"edit snippets
nmap <leader>es :e ~/.vim/UltiSnips/<cr>

"edit zshrc
nmap <leader>ez :e ~/.zshrc<cr>

" write, then close the buffer
nmap <leader>wbd :w<cr> :bd<cr>

"unhighlight search results"
nmap <leader><space> :nohlsearch<cr>           

"simplify NERDTree; set CTR-1 to toggle it"
nmap 1 :NERDTreeToggle<cr>

"manage ctr-P (plugin)"
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-f> :CtrlPMRUFiles<cr>
nmap <leader>bt :bufdo tab split<CR>
let g:ctrlp_custom_ignore = 'node_modules\|git'

"spell checking
nmap <leader>spell :setlocal spell spelllang=en_us<CR>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Remove all leading whitespace by pressing F4
nnoremap <F4> :let _s=@/<Bar>:%s/^\s\+//e<Bar>:let @/=_s<Bar><CR>

" CS Fixer 
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR> 
"nmap <C-o> :lopen<cr>
nmap <C-c> :lclose<cr>

" Surround text with ()
xnoremap <leader>s( xi()<Esc>P

" Surround text with []
xnoremap <leader>s[ xi[]<Esc>P

" Surround text  with {}
xnoremap <leader>s{ xi()<Esc>P

"---- Laravel-Specific ----"
nmap <leader>l4r :e app/Http/routes.php<cr>
nmap <leader>lr :e routes/web.php<cr>
nmap <leader>lm !php artisan make:
nmap <leader>lc :CtrlP app/Http/Controllers/<cr>
nmap <leader>lv :CtrlP resources/views/<cr>

"---- PHP ----"
"php code completion w/ctrl-x ctrl-o (or p)
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set omnifunc=syntaxcomplete#Complete

"---- GOLANG-Specific ----"
augroup go
    autocmd!
    " Show by default 4 spaces for a tab
    autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    " :GoBuild and :GoTestCompile
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    " :GoTest
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    
    " :GoRun
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    
    " :GoDoc
    autocmd FileType go nmap <Leader>d <Plug>(go-doc)
    
    " :GoCoverageToggle
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
    
    " :GoInfo
    autocmd FileType go nmap <Leader>i <Plug>(go-info)
    
    " :GoMetaLinter
    autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
augroup END

"======= VimWiki notetaking
nmap <Leader>wn <Plug>VimwikiNextLink
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/kb'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"======= Livedown Markdown Server ====="
" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = "Firefox"

"======= cscope ====="
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif

nmap <C-\>s :cs find s =expand("")
nmap <C-\>g :cs find g =expand("")
nmap <C-\>c :cs find c =expand("")
nmap <C-\>t :cs find t =expand("")
nmap <C-\>e :cs find e =expand("")
nmap <C-\>f :cs find f =expand("")
nmap <C-\>i :cs find i ^=expand("")$
nmap <C-\>d :cs find d =expand("")

"set nohlsearch

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
