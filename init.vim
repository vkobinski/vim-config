" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Install plugins with vim-plug https://github.com/junegunn/vim-plug
" Reload and runs :PlugInstall to install plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'slim-template/vim-slim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-rails'

call plug#end()

let g:airline_theme='bubblegum'

lua << EOF
require("nvim-autopairs").setup {}
EOF

" Use The Silver Searcher if available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" -- Configurations --

" Enable syntax highlighting
syntax on

" Don't wrap long lines
set nowrap

" Use 2 spaces for tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Set default colorscheme to solarized
set background=dark
silent! colorscheme gruvbox

" Enable line numbers and don't make them any wider than necessary
set number numberwidth=2

" Set GUI font
" get the Fira Code font from https://github.com/tonsky/FiraCode
if has('gui_running')
  if executable('fc-list')
    let font_exists = system('fc-list | grep -i -q "Fira Code Retina"')

    if font_exists == 0
      set guifont=Fira_Code_Retina:h13
    else
      set guifont=Monaco:h13
    endif
  endif
endif

" -- Mappings --

" Toggle NERDTreeToggle
nmap <Leader>g :NERDTreeToggle<CR>

" Switch between panes
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Mapping CtrlP command
nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
nnoremap <Leader>t :<C-U>CtrlP<CR>
