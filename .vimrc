syntax on
set nowrap
set encoding=utf8

let MY_HOME='/home/pvnick'

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
Plugin 'Townk/vim-autoclose'
Plugin 'vim-syntastic/syntastic'

Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'

let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>


" Theming
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Color scheme
Plugin 'tomasr/molokai'
:colorscheme molokai
let g:molokai_original = 1

call vundle#end()            " required
filetype plugin indent on    " required

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
