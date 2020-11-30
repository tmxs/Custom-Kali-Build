" +-----------------+
" | Install Plugins |
" +-----------------+

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Text Editing
Plugin 'VundleVim/Vundle.vim'
Plugin 'cocopon/iceberg.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mhinz/vim-startify'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim' 
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/AutoComplPop'

" Developement
Plugin 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plugin 'StanAngeloff/php.vim', {'for': 'php'}
Plugin 'mhinz/vim-signify'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'

call vundle#end()   

" +----------------+
" | General Config |
" +----------------+
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=de,en
set completeopt=menuone,longest
set clipboard=unnamedplus
set complete+=kspell
set shortmess+=c
set undolevels=10000
set undoreload=10000
set relativenumber
set scrolloff=999
set laststatus=2
set shiftwidth=2
set smartindent
set ignorecase
set noswapfile
set mouse=a
set number

filetype plugin on
filetype indent on
filetype off 
colorscheme iceberg
syntax enable

" automatic closing of braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" +---------------+
" | Plugin Config |
" +---------------+

" Lightline

let g:lightline = {
 \ 'colorscheme': 'iceberg',
 \ 'active': {
 \   'left': [ 
 \	[ 'mode', 'paste' ],
 \      [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
 \    ]
 \ },
 \ 'component_function': {
 \   'gitbranch': 'FugitiveHead'
 \ },
\ }

let g:startify_bookmarks = [ 
 \{'z': '~/.zshrc'}, 
 \{'i': '~/.config/i3/config'},
 \{'v': '~/.config/nvim/init.vim'},
\]

" Note-Taking
autocmd BufNewFile,BufRead *.md set filetype=markdown
let g:limelight_conceal_ctermfg = 240
let g:vimwiki_list = [
 \{'path': 'Notes-Path', 
 \'syntax': 'markdown', 
 \'ext': '.md'},
\]

" PHP-CS-Fixer
let g:php_cs_fixer_path = "/home/tim/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_rules = "@Symfony"
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_cache = ".php_cs.cache"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" FZF
nnoremap <C-S-P> :GFiles<CR>
