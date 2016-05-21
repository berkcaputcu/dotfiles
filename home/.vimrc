execute pathogen#infect()

" Syntax coloring
syntax on
set synmaxcol=200 " don't color after 200th column

filetype plugin indent on

au BufWritePost *.rb silent! !eval 'rm -f tags; ctags -R --languages=ruby --exclude=.git --exclude=log' &

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

" Disable GitGutter
let g:gitgutter_enabled = 0

" Mapping
let mapleader="\<Space>"
nnoremap <leader>c :nohlsearch<CR>
nnoremap <leader>cc :nohlsearch<CR>

" Normal mode on jk
imap jk <esc>

" Enter commands with semicolon
nnoremap ; :

" Faster rails paths
noremap ,ja :CtrlP app<CR>
noremap ,jd :CtrlP db<CR>
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
noremap ,jpm :CtrlP app/models/payments<CR>
noremap ,jpt :CtrlP test/unit/payments<CR>

nmap <leader>n :NERDTree<CR>

" binding.pry
noremap <leader>b ibinding.pry<Esc>==

" paste last yank
noremap <leader>p "0p

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

nnoremap <leader>tt :call RunTestOnlyScript("")<CR>
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

" CtrlP settings
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_regexp = 1

" lightline settings
set noshowmode " don't show default vim message

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
      \             [ 'ctrlpmark' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'ctrlpmark': 'CtrlPMark',
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

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

" Silversearch
set runtimepath^=~/.vim/bundle/ag

" Abbreviations
iabbrev edn end
iabbrev wehn when
iabbrev dfe def
