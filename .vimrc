set nocompatible
set hlsearch

" show current line number
set number relativenumber

" I use source control instead of backup files
set nobackup
set noswapfile

set wildmenu
set wildmode=list:full

" highlight current cursor line
set cursorline

" theme
syntax enable

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" use spaces instead of tabs
set expandtab

" always indent by multiple of shiftwidth
set shiftround

" indend/deindent at the beginning of a line
set smarttab

" always keep 3 lines around the cursor
set scrolloff=3
set sidescrolloff=3

" draw less
set lazyredraw

" always show status line
set laststatus=2

" enable mouse scroll and select
set mouse=a

" Display quotes in json in all modes
set conceallevel=0

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
