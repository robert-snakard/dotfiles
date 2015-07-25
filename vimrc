silent! execute pathogen#infect()

set nocompatible

syntax enable
colorscheme dracula

let mapleader=" "

set backupdir=~/.vim/backup
set directory=~/.vim/temp
set undodir=~/.vim/undo
set undofile

set backspace=indent,eol,start
set complete-=i

set autoindent
set smartindent
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase
nnoremap <leader><leader> :noh<CR>

set lazyredraw
set laststatus=2
set ruler
set showcmd
set showmatch

set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions

set scrolloff=10
set sidescrolloff=10

set display+=lastline

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set formatoptions+=j

set shell=/bin/bash

set history=1000

inoremap <C-U> <C-G>u<C-U>

set noerrorbells

set number
set relativenumber

set cursorline

nnoremap gV `[v`]

set autoread

vnoremap <silent>* :call VisualSelection('f', '')<CR>
vnoremap <silent># :call VisualSelection('b', '')<CR>

nnoremap n nzz
nnoremap N Nzz

set mouse=a

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <C-;> :

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

nnoremap <CR><CR> <CR>
nnoremap <CR> :

nnoremap <Tab> <C-i>
nnoremap <BS> <C-o>

set dictionary=/usr/share/dict/words

set linebreak




" Show syntax highlighting groups for word under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
