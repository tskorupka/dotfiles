set number

let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']

let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '512M'

let g:lightline = {
    \ 'component': {
    \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}'
    \ },
    \ 'active': {
    \   'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:phpcd_autoload_path = '~/.vim/plugged/phpcd.vim/vendor/autoload.php'

" Autocommands

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Shortcuts

:nnoremap <Leader>q :Bdelete<CR>
:nnoremap <Leader>w :Bwipeout<CR>
:nnoremap <F8> :TagbarToggle<CR>
:nnoremap <F9> :ALEToggle<CR>
:nnoremap <F10> :NERDTreeToggle<CR>

" Autocompletion
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Autocompletion with ultisnips
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Linting
let g:ale_linters = {
    \ 'php': ['php'],
    \ }
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


" PHP
let g:php_namespace_sort_after_insert = 1
let g:vim_php_refactoring_make_setter_fluent = 2

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
autocmd FileType php :set expandtab
autocmd FileType php :set tabstop=2
autocmd FileType php :set shiftwidth=2

" GIT
set updatetime=100

" Documenting code
let g:pdv_template_dir = $HOME ."./.vim/plugged/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" autocmd FileType php setlocal commentstring=// %s
