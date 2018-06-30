set nocompatible              " i.e. not compatible with vi

" turn off filetype and syntax while we load other plugins
filetype plugin indent off    
syntax off 

set shell=/bin/bash

" Load vim-plug if not already loaded
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Apply plugins
call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'
Plug 'git://git.wincent.com/command-t.git'

Plug 'tpope/vim-surround'
" for controlling things like brackets which surround things

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'

call plug#end()

let wimpMessage ="Arrow keys are for wimps!"

noremap <Up> :echoerr wimpMessage<CR>
noremap <Down> :echoerr wimpMessage<CR>
noremap <Left> :echoerr wimpMessage<CR>
noremap <Right> :echoerr wimpMessage<CR>
inoremap <Up> <esc>:echoerr wimpMessage<CR>i
inoremap <Down> <esc>:echoerr wimpMessage<CR>i
inoremap <Left> <esc>:echoerr wimpMessage<CR>i
inoremap <Right> <esc>:echoerr wimpMessage<CR>i


function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> _ :call <SID>swap_up()<CR>
noremap <silent> - :call <SID>swap_down()<CR>

nnoremap U <C-r> 
set number " Line numbers visible
set is " Incremental search on
set hls " Highlight search on

filetype plugin indent on     

set ruler
set shiftwidth=2
set tabstop=2
set expandtab

set history=200 " Store 200 commands in history
set wildmenu " Shows potential matches for search queries
set showcmd " Shows incomplete commands in bottom right
set scrolloff=4 " Try to allow a buffer of 4 lines between cursor and top or bottom of screen

set bg=dark
set ignorecase " Make searches case insensitive
set smartcase " ...unless they contain upper case letters
set lbr " Only break lines between words
set ai " Auto indent
set si " Smart indent
color delek

syntax on

" vim: set ft=vim :
