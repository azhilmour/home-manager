" ~/.vimrc — managed by Home Manager (symlinked via home.file)

set nocompatible             " use Vim's own features, not vi-compatible mode (must come first)
syntax on                    " turn on syntax highlighting
filetype plugin indent on    " detect file type; load its plugin + indent rules

" UI
set number                   " show the absolute line number in the left gutter
set relativenumber           " show line numbers relative to the cursor (pairs with `number`)
set ruler                    " show line,column of the cursor in the bottom-right
set showcmd                  " show the partially-typed command in the bottom-right
set laststatus=2             " always show the status line (even with one window)
set wildmenu                 " show completion matches as a menu on the command line (:e <Tab>)
set scrolloff=5              " keep 5 lines visible above/below the cursor when scrolling

" Search
set incsearch                " jump to matches as you type the search
set hlsearch                 " highlight all matches of the last search
set ignorecase               " case-insensitive search by default
set smartcase                " ...but become case-sensitive if the pattern has a capital letter

" Indentation
set expandtab                " insert spaces instead of a literal tab character
set tabstop=2                " a tab counts as 2 columns wide
set shiftwidth=2             " >>, << and auto-indent use 2 spaces per level
set autoindent               " new lines keep the previous line's indent
set smartindent              " add/remove a level of indent based on code syntax ({, }, etc.)

" Behaviour
set hidden                   " allow switching away from a modified buffer without saving
set backspace=indent,eol,start  " let backspace delete over auto-indent, line breaks, and past insert start
set clipboard=unnamedplus    " route yanks/pastes through the system clipboard (needs a +clipboard vim)
set mouse=a                  " enable mouse in all modes

" Clear search highlight with <space>
nnoremap <silent> <Space> :nohlsearch<CR>   " press Space in normal mode to clear :hlsearch highlights
