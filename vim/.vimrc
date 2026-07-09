" ~/.vimrc — managed by Home Manager (symlinked via home.file)

set nocompatible
syntax on
filetype plugin indent on

" UI
set number
set relativenumber
set ruler
set showcmd
set laststatus=2
set wildmenu
set scrolloff=5

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Behaviour
set hidden
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a

" Clear search highlight with <space>
nnoremap <silent> <Space> :nohlsearch<CR>
