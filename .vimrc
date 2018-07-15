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

  Plug 'vim-scripts/ZoomWin'
  " Toggles multiwindow mode

  Plug 'junegunn/vim-plug'
  " Nice simple vim plugin manager

  "This isn't working until I fix the C extension...
  Plug 'git://git.wincent.com/command-t.git'
  " Fast fuzzy file finder

  Plug 'ctrlpvim/ctrlp.vim'
  " path fuzzy file, buffer, mru, tag, ... finder 

  " Plug 'tomtom/tcomment_vim'
  " toggles commenting out via 'gc' command

  Plug 'tpope/vim-surround'
  " for controlling things like brackets which surround things

  Plug 'tpope/vim-fugitive'
  " for git operations - e.g. blame, dif etc.

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " gives you supercool interactive file trees
  Plug 'scrooloose/nerdcommenter'
  " commenting 

  Plug 'https://github.com/vim-syntastic/syntastic'
  " facilitates syntax highlighting etc.

  Plug 'tmhedberg/matchit'
  " jump to matching things e.g. Html / XML tags using % key

  Plug 'sickill/vim-pasta'
  " matches correct indentation when pasting

  Plug 'ervandew/supertab'
  " allows use of <Tab> for autocompletion

															" Language plugins
  Plug 'keith/swift.vim'
  Plug 'udalov/kotlin-vim'


  " Color schemes:
  Plug 'nightsense/stellarized'
	Plug 'nightsense/snow'
  Plug 'kadekillary/subtle_solo'

call plug#end()


" Different color scheme for read-only mode (opened with view)
if v:progname ==? 'view'
  set bg=light
  colorscheme subtle_dark
else
  set background=dark
  colorscheme stellarized
endif

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

" TODO - refactor wimp message into function
let wimpMessage ="Arrow keys are for wimps!"

noremap <Up> :echoerr wimpMessage<CR>
noremap <Down> :echoerr wimpMessage<CR>
noremap <Left> :echoerr wimpMessage<CR>
noremap <Right> :echoerr wimpMessage<CR>
inoremap <Up> <esc>:echoerr wimpMessage<CR>i
inoremap <Down> <esc>:echoerr wimpMessage<CR>i
inoremap <Left> <esc>:echoerr wimpMessage<CR>i
inoremap <Right> <esc>:echoerr wimpMessage<CR>i

nnoremap U <C-r> 
" Capital U for redo
  
nnoremap <leader>o <esc>:CommandT<CR>

set number " Line numbers visible
set is " Incremental search on
set hls " Highlight search on

filetype plugin indent on     

set textwidth=80
set colorcolumn=+1

set shiftwidth=2
set tabstop=2
set softtabstop=2 "Insert two paces when tab is pressed
set expandtab
set ai " Auto indent
set si " Smart indent

set history=200 " Store 200 commands in history
set wildmenu " Shows potential matches for search queries
" set showcmd " Shows incomplete commands in bottom right
set scrolloff=4 " makes a buffer of 4 lines 
" between cursor and top or bottom of screen

set bg=dark
set ignorecase " Make searches case insensitive
set smartcase " ...unless they contain upper case letters
set lbr " Only break lines between words

" set hidden " Allows modifying multiple buffers without saving
set clipboard=unnamedplus " connects the system clipboard to the unnamed register
set paste
set ruler

syntax on " nice colourful words :)

" vim: set ft=vim :
