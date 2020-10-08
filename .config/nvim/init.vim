set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'bfredl/nvim-miniyank'
Plug 'moll/vim-bbye'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
Plug 'dense-analysis/ale'

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-ultisnips'

" php
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'StanAngeloff/php.vim'
Plug 'phpstan/vim-phpstan'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'arnaud-lb/vim-php-namespace'
Plug 'yaoguais/phpctags.vim', { 'do': ':GoUpdateBinaries' }
Plug 'stephpy/vim-php-cs-fixer'
Plug 'adoy/vim-php-refactoring-toolbox'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Documenting code
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

" Initialize plugin system
call plug#end()
