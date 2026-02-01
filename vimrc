"""""""""""""""""""""""""""""""""""""""""""""""""
" Sections
"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
" ==> Colors and Themes
" ==> File management
" ==> Tabs, indentation, and encoding
" ==> Navigation
" ==> Status line


"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
"""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with Vi
set nocompatible

" Sets how many lines of history Vim remenbers
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set relative line numbers
set number
set relativenumber

" Show last command
set showcmd

" Enable wildmenu for autocompletion and turn off popup menu
set wildmenu
if v:version >= 900
	set wildoptions=pum
endif

" Set height of the command bar
set cmdheight=1

" Search case-insenstive by default, be smart, and highligt
set ignorecase
set smartcase
set incsearch
set hlsearch

" Give easy option to turn off highlight of last searc
nnoremap <F3> :noh<cr>

" Show matching brackets
set showmatch

" No error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Blink cursor on error instead of beeping (grr)
" set visualbell

" remap mapleader
let mapleader="\<Space>"

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set wrapping of lines
set wrap

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python % <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors and Themes
"""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable all highlighting for Python
let python_highlight_all=1

" Add color themes
packadd! everforest
packadd! gruvbox
packadd! gruxbox-material
packadd! onedark

if has('termguicolors')
	set termguicolors
endif

" For dark version.
set background=dark
colorscheme everforest

" Highlight current line
set cursorline

" Highlight trailing whitespaces
highlight RedundantSpaces ctermbg=DarkCyan guibg=DarkCyan 
match RedundantSpaces /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> File management
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off backups
set nobackup
set nowb
set noswapfile

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Enable NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<cr> 

" Ignore some file types
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Tabs, indentation, and encoding
"""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding
set encoding=utf8

" Use spaces instead of tabs, and be smart
set expandtab
set smarttab

" 1 tab := 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Autoindent, and be smart
set ai
set si

" Enable folding on indentation
set foldenable
set foldmethod=indent
set foldlevelstart=99
set foldnestmax=5


"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use jj to exit insert mode
inoremap jj <Esc>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Tab management
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Status line
"""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


