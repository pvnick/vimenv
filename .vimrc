syntax on
set nowrap
set encoding=utf8

let MY_HOME='/home/paul'

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Enable folding
set foldmethod=indent
set foldlevel=99
" Use Space to fold/unfold
nnoremap <space> za

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &runtimepath.=','.MY_HOME.'/.vim/bundle/Vundle.vim'
call vundle#begin(MY_HOME.'/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" Generic programming plugins
" Plugin 'Townk/vim-autoclose'
Plugin 'vim-syntastic/syntastic'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/vimproc.vim'
Plugin 'idanarye/vim-vebugger'
Plugin 'hkupty/iron.nvim'

" Theming
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

" Debugger commands
let g:vebugger_leader = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Color scheme
:colorscheme molokai
let g:molokai_original = 1

" Nerdtree options
autocmd vimenter * NERDTree " Automatically open Nerdtree
autocmd VimEnter * wincmd p " Move cursor to file space
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if the last thing open is nerdtree

" Hotkey F8 for opening up tagbar
nmap <F8> :TagbarToggle<CR>
" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python options
let python_highlight_all=1

" Remap pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Paste and nopaste shortcuts
nnoremap <C-P> :set paste<CR>
nnoremap <C-N><C-P> :set nopaste<CR>
