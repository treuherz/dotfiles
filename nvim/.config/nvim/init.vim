" Plugins with Plug
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-sleuth'
" Plug 'vim-syntastic/syntastic'
Plug 'jpalardy/vim-slime'
" Plug 'cohama/lexima.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-indentwise'
" Plug 'bfredl/nvim-ipy'
Plug 'neomake/neomake'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'tweekmonster/braceless.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/echodoc.vim'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
" Plug 'Shougo/neopairs.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'bazelbuild/vim-bazel'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" My settings

set undofile
set undodir=~/.nvundo/

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>

map <Leader>F :RangerNewTab<CR>

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set scrolloff=1
set sidescrolloff=5

set autoindent
set smartindent
set smarttab

set mouse=a

au FileType html,eruby,rb,css,js,xml runtime! macros/matchit.vim

set ignorecase
set smartcase

set wrap
set linebreak

set ruler
set colorcolumn=81

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
:au VimLeave * set guicursor=a:ver100-blinkon0

set tags=./tags;
let g:gutentags_ctags_exclude = ['bazel-*']

"set magic

set inccommand=split

set noshowmode

set completeopt+=noinsert
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

autocmd FileType gitcommit,latex,tex,md,markdown setlocal spell

set foldmethod=syntax
set foldcolumn=1
let g:sh_fold_enabled=5
" set nofoldenable
" Save/load fold setup when files closed
autocmd BufWinLeave ?* mkview!
autocmd BufWinEnter ?* try|loadview|catch|silent! foldopen!|endtry
" ...But don't save your pwd in the view
set viewoptions-=options
highlight FoldColumn ctermfg=10
highlight Folded ctermfg=10 cterm=NONE

let g:incsearch#consistent_n_direction = 1

" Turns on cursorline only for the current window.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" 'Hybrid' number mode. Shows relative numbers everywhere except the current
" line, where it shows the absolute.
set relativenumber
set number

au FileType help nmap <buffer> <Esc> :helpclose<CR>

" " Change cursor shape accoding to mode
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"

" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='solarized'

highlight SignColumn ctermbg=8

" Sensible tab defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

inoremap <M-o> <Esc>o
inoremap <M-O> <Esc>O
let g:ragtag_global_maps = 1

let delimitMate_expand_cr = 2
au FileType python let b:delimitMate_nesting_quotes = ['"']

let g:airline#extensions#tabline#enabled = 1

au BufNewFile,BufRead,BufReadPost *.rkt,*.rktl,*.rktd set filetype=scheme

au BufNewFile,BufRead,BufReadPost *BUILD set filetype=bzl

autocmd FileType python BracelessEnable +indent

cmap w!! :SudoWrite<CR>

" set statusline+=%#warningmsg#
" set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_generic = 1
" let g:syntastic_javascript_eslint_exec = 'xo:'
" let g:syntastic_javascript_esline_args = '--reporter=compact'
" let g:syntastic_python_checkers = ['prospector']

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

let g:neomake_python_pylint_args = [
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
        \ '--reports=no',
        \ '-E'
        \ ]
let g:neomake_error_sign = {
        \ 'text': 'E',
        \ 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
        \ 'text': 'W',
        \ 'texthl': 'NeomakeWarningSign',
        \ }
let g:neomake_message_sign = {
        \ 'text': 'M',
        \ 'texthl': 'NeomakeMessageSign',
        \ }
let g:neomake_info_sign = {'text': 'I', 'texthl': 'NeomakeInfoSign'}
let g:neomate_sql_enabled_makers = ['sqlint']
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_html_enabled_makers = ['htmlhint']
let g:neomake_shell_enabled_makers = ['shellcheck']
highlight NeomakeErrorSign ctermfg = 1 ctermbg = 0
highlight NeomakeWarningsign ctermfg = 3 ctermbg = 0
highlight NeomakeMessageSign ctermfg = 2 ctermbg = 0
highlight NeomakeInfoSign ctermfg = 4 ctermbg = 0
autocmd! BufWritePost * Neomake
