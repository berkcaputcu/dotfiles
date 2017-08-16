" Install vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-abolish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rhubarb'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()

filetype plugin indent on

" Syntax coloring
syntax on
set synmaxcol=200 " don't color after 200th column

" generate ctags
nnoremap <leader>ct :! rm -f tags; ctags -R --languages=ruby --exclude=.git --exclude=log<CR>

" System clipboard
set clipboard=unnamed

" Theme
set background=dark
colorscheme solarized

" Diff theme
highlight DiffAdd ctermfg=250 ctermbg=22
highlight DiffDelete ctermfg=250 ctermbg=52
highlight DiffChange ctermfg=250 ctermbg=25
highlight DiffText ctermfg=250 ctermbg=130 cterm=bold

" Match
runtime macros/matchit.vim

" Swap files are annoying
set nobackup
set nowritebackup
set noswapfile

" Tab to spaces
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set autoread
set autoindent

" Sane backspace
set backspace=eol,start,indent

" Cursor surrounding
set scrolloff=5

" Ignorecase
set ignorecase

" Higlight current line unless it's a diff view
if !&diff
  set cursorline
endif

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

" Save buffers when they are hidden
set autowrite

" Fugitive - branch in status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" auto diffupdate
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Disable GitGutter
let g:gitgutter_enabled = 0

" Mapping
let mapleader="\<Space>"
nnoremap <leader>c :nohlsearch<CR>

" Normal mode on jk
imap jk <esc>

" Enter commands with semicolon
nnoremap ; :

" Faster rails paths
noremap ,ja :Files app<CR>
noremap ,jd :Files db<CR>
noremap ,jm :Files app/models<CR>
noremap ,jj :Files app/jobs<CR>
noremap ,jc :Files app/controllers<CR>
noremap ,jv :Files app/views<CR>
noremap ,jh :Files app/helpers<CR>
noremap ,js :Files app/services<CR>
noremap ,jl :Files lib<CR>
noremap ,jC :Files config<CR>
noremap ,jV :Files vendor<CR>
noremap ,jtt :Files test<CR>
noremap ,jT :Files test<CR>
noremap ,jtf :Files test/fixtures<CR>
noremap ,jpt :Files components/shopify_payments/test<CR>
noremap ,jpp :Files components/shopify_payments<CR>
noremap ,jpm :Files components/shopify_payments/app/models/payments<CR>

nmap <leader>n :NERDTree<CR>

" binding.pry
noremap <leader>b ibinding.pry<Esc>==

" paste last yank
noremap <leader>p "0p

" copy all
nnoremap <leader>a ggyG

" copy current file path
nmap <leader>d :let @* = expand("%")<CR>

" toggle paste mode before pasting
noremap ,p :set pastetoggle=<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" search results in the middle
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bb :bp<CR>

" Windows
nnoremap ,, <C-w>w
nnoremap <C-w>h 10<c-w><
nnoremap <C-w>l 10<c-w>>
nnoremap <C-w>j 10<c-w>+
nnoremap <C-w>k 10<c-w>-

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

nnoremap <leader>vs <C-w>v<C-w>l
nnoremap <leader>sp <C-w>s<C-w>j

" Tabs
map <leader>tn :tabnew<cr>

" Shift to go between tabs
nnoremap <S-h> gT
nnoremap <S-l> gt

" Git
function! PushToCurrentBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  execute "Dispatch git push origin " . branch
endfunction

function! BundleUp()
  execute "silent !Git checkout master"
  execute "silent !Git pull origin master"
  execute "redraw!"
  execute "Dispatch /opt/dev/bin/dev up"
endfunction

nnoremap <leader>ggp :call PushToCurrentBranch()<CR>
nnoremap <leader>ggl :call BundleUp()<CR>
nnoremap <leader>ggb :Git branch<space>
nnoremap <leader>ggc :Git checkout<space>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gbrowse<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Ggrep<space>

" Gitgutter mappings
nnoremap <leader>ggt :GitGutterToggle<CR>

" Testing
function! RunTestOnlyScript(options)
  let filename_to_test = expand('%:t:r')
  execute "Dispatch ruby ~/dotfiles/scripts/testonly.rb " . filename_to_test . " " . a:options
endfunction

" nnoremap <leader>tt :call RunTestOnlyScript("")<CR>
nnoremap <leader>ta :call RunTestOnlyScript("-a")<CR>
nnoremap <leader>to :Dispatch ruby ~/dotfiles/scripts/testonly.rb<space>
nnoremap <leader>tc :Dispatch dev test %<CR>

nnoremap <leader>co :Copen<CR>

" Convert hash rockets to new syntax
nnoremap <leader>{ :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

" Save and Quit
nnoremap <leader>q :close<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :w<CR>
:command! Q q
:command! Qa qa

" Save session
nnoremap <leader>S :mksession<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
onoremap B ^
onoremap E $

" Source this file
nnoremap <leader>sv :source ~/.vimrc<CR>
nnoremap <leader>ev :e ~/.vimrc<CR>

" vim-notes settings
:let g:notes_directories = ['~/Desktop/docs/notes']
:let g:notes_suffix = '.vmnt'
:let g:notes_tab_indents = 0
:let g:notes_conceal_code = 0
:let g:notes_conceal_url = 0
:let g:notes_smart_quotes = 0
:let g:notes_list_bullets=[]

" commmand-t settings
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-t> :Tags<CR>

let g:fzf_tags_command = 'ctags -R --languages=ruby --exclude=.git --exclude=log'

" Legacy CommandT settings
" let g:CommandTFileScanner = 'git'
" let g:CommandTMaxFiles = 10000000
" let g:CommandTMaxHeight = 10

" highlight CommandTHighlightColor term=reverse cterm=reverse ctermfg=0 ctermbg=7 guibg=Grey40 gui=bold
" let g:CommandTHighlightColor = 'CommandTHighlightColor'

" lightline settings
set noshowmode " don't show default vim message

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return "\ue0a2"
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

" Silversearch
set runtimepath^=~/.vim/bundle/ag

" Abbreviations
iabbrev edn end
iabbrev wehn when
iabbrev dfe def
