set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" 
" Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'beanworks/vim-phpfmt'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-airline/vim-airline'
Plugin 'StanAngeloff/php.vim'
Plugin 'joonty/vim-phpqa'
"Plugin 'rking/ag.vim'
"Plugin 'skwp/greplace.vim'
" snipmate and its dependencies (dependencies first)
"Plugin 'tomtom/tlib_vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'garbas/vim-snipmate'
" Golang plugins
Plugin 'fatih/vim-go'
" PHP CS Fixer
Plugin 'stephpy/vim-php-cs-fixer'
" Markdown Preview in browser
"Plugin 'shime/vim-livedown'
" Ultisnips
"Plugin 'SirVer/ultisnips'
" Vim IDE Perl
Plugin 'vim-scripts/perl-support.vim'
"find syntax highlighting issues
Plugin 'vim-scripts/SyntaxAttr.vim'
" VimWiki
"Plugin 'vimwiki/vimwiki'
" Ansible plugin "
Plugin 'pearofducks/ansible-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
