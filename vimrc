" === Load plugins via Vundle ============================================== "
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'hdima/python-syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'

call vundle#end()

" === Basic config ========================================================== "
filetype plugin indent on
syntax enable

set hidden                          " hide buffers instead of abandoning them
set encoding=utf-8
set number

set backspace=indent,eol,start      " backspace should delete things
set showmatch                       " highlight opening brace when closing

set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set laststatus=2
set ruler
set showcmd
set wildmenu                        " enhance file name completion
set scrolloff=5                     " at least this many lines around cursor
set sidescrolloff=5                 " at least this many chars around cursor
set display+=lastline

let &listchars = "tab:> ,trail:-,extends:#,precedes:+,nbsp:~"

set incsearch

set ttimeout
set ttimeoutlen=50

set undofile
set undodir=~/.vimundo

let mapleader = ","
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

set history=1000
set tabpagemax=50
set showtabline=2

" === Solarized Color Scheme ================================================ "
set t_Co=16
set background=dark
colorscheme solarized

" === python-syntax (provides Python 3 highlighting) ======================== "
let python_highlight_builtins = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1

" === Indent only 2 spaces in HTML files ==================================== "
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType jinja setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2
