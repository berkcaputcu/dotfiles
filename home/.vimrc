execute pathogen#infect()
syntax on
filetype plugin indent on

" Theme
set background=dark
colorscheme solarized

" Match
runtime macros/matchit.vim

" Swap files are annoying
set noswapfile

" Tab to spaces
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

" Sane backspace
set backspace=eol,start,indent

" Cursor surrounding
set scrolloff=10

" Ignorecase
set ignorecase

" Higlight current line
set cursorline

" Relative line numbers
set relativenumber

" Show line numbers
set number

" Higlight long lines
set colorcolumn=121

" Menu options
set wildmenu

" Search
set showmatch
set incsearch
set hlsearch

" Status bar
set laststatus=2
set ruler

" Hide buffers with changes
set hidden

" Fugitive - branch in status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Mapping
let mapleader="\<Space>"
nnoremap <leader>c :nohlsearch<CR>

" Normal mode on jk
imap jk <esc>

" Make newlines more easily.
nmap <CR> o<Esc>

" Faster rails paths
noremap ,ja :CtrlP app<CR>
noremap ,jm :CtrlP app/models<CR>
noremap ,jj :CtrlP app/jobs<CR>
noremap ,jc :CtrlP app/controllers<CR>
noremap ,jv :CtrlP app/views<CR>
noremap ,jh :CtrlP app/helpers<CR>
noremap ,js :CtrlP app/services<CR>
noremap ,jl :CtrlP lib<CR>
noremap ,jC :CtrlP config<CR>
noremap ,jV :CtrlP vendor<CR>
noremap ,jt :CtrlP test<CR>
noremap ,jf :CtrlP test/fixtures<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bb :bp<CR>

" Windows
nnoremap ,, <C-w>w

nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

nnoremap ,L <C-w>L
nnoremap ,K <C-w>K
nnoremap ,J <C-w>J
nnoremap ,H <C-w>H

nnoremap ,s <C-w>s
noremap ,v <C-w>v

nnoremap ,c <C-w>c
nnoremap ,o <C-w>o

nnoremap <leader>vs :vs<cr>
nnoremap <leader>s :s<cr>

" Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Git
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>

" Save and Quit
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Save session
nnoremap <leader>S :mksession<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Source this file
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>ev :e ~/.vimrc<CR>

" CtrlP settings
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Silversearch
set runtimepath^=~/.vim/bundle/ag
