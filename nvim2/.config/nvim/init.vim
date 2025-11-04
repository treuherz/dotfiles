call plug#begin()
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth' " change tab size based on current file
Plug 'tpope/vim-speeddating' " increments/decrements for dates and times

Plug 'loctvl842/monokai-pro.nvim'
Plug 'itchyny/lightline.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

Plug 'ray-x/go.nvim'
call plug#end()

set mouse=a

let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>

set undofile
set undodir=~/.nvundo/

set termguicolors
set background=dark
colorscheme monokai-pro
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }

set autoindent
set smartindent
set smarttab

set ignorecase
set smartcase

set wrap
set linebreak

" 'Hyrbrid' mode
set relativenumber
set number
