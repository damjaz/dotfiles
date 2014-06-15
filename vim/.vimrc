set nocompatible


"
" Vundle
"


filetype off  " vundle requires this to be off initially
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'tpope/vim-fugitive'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
"Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'

" snipmate & deps
Bundle 'sirver/ultisnips'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'


"
" General
"


filetype plugin indent on " can turn it on after adding bundles
syntax on
language en_US.utf8

" always work in utf-8
set encoding=utf-8
set fileencoding=utf-8

set mouse=a " enable mouse in all modes
set hidden " hides buffers instead of closing them
set shortmess=atI " no intro
set history=1000
set undolevels=1000
set clipboard+=unnamed " TODO: ?share clipboard?
" Since I use linux, I want this
let g:clipbrdDefaultReg = '+' " TODO: test
" no swap/backup files
set nobackup
set noswapfile
set nowb
" change directory to the current buffer when opening files.
set autochdir
set autoread


"
" Editing
"


set backspace=indent,eol,start
set fileformats=unix,dos,mac
set autoindent
set smartindent
set expandtab " spaces instead of tabs
set tabstop=2 " number of spaces used instead of tab
set shiftwidth=2 " number of spaces for autoindent etc.
set softtabstop=2 " virtual tabs


"
" Look & Feel
"


au WinLeave * set nocursorline
au WinEnter * set cursorline

let loaded_matchparen = 1
set viminfo^=% " Remember info about open buffers on close
set t_Co=256
set listchars=tab:\ \ ,trail:.
set laststatus=2 " always show status line
"set statusline=[\ %F\ %m\ ]\ %{fugitive#statusline()}\ %y%=%l,%c\ %P "TODO: change
set number " show line numbers
set relativenumber
set title
set ruler " row and col number in status line
set showcmd
set showmode
set cursorline
set nowrap " dont wrap lines
set colorcolumn=81
set noerrorbells
set novisualbell
set lazyredraw
" horizontal and vertical context
set scrolloff=10
set sidescroll=10
set sidescrolloff=10

set hlsearch " highlight search terms
set incsearch " show matches as u type
set ignorecase
set smartcase " ignore case when search pattern is all lowercase

set wildmenu
set wildmode=list:longest,full
set wildchar=<TAB>
set wildignore=*.o,*~,*.pyc,.git

set foldmethod=marker
set foldnestmax=3
set foldcolumn=1
set nofoldenable " dont fold by default
"When completing by tag, show the whole tag, not just the function name
set showfulltag "TODO: test it.
" get rid of the silly characters in separators
set fillchars = ""

"
" Key mapping
"


let mapleader=","
let g:mapleader=","
" dont throw reverse character search cmd
noremap \ ,
set pastetoggle=<F4>
" no shift commands
nnoremap ; :
"nnoremap : ;
" clear highlighted searches
nmap <silent> <leader>/ :nohlsearch<CR>
" remove trailing whitespaces
map <silent> <F3> :%s/\s\+$//e<CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" easy resizing
map <silent> <leader>< :vertical resize -5<CR>
map <silent> <leader>> :vertical resize +5<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make the current file executable
nmap <silent> <leader>x :w<cr>:!chmod 755 %<cr>:e<cr>

" next/prev buffer
map <silent> <C-p> :bp <CR>
map <silent> <C-n> :bn <CR>

" Use :w!! to save with sudo if you're editing a readonly file
cmap w!! w !sudo tee % >/dev/null


"
" GUI config (gvim)
"


if has("gui_running")
  set guioptions=c " fock toolbars and other shit
  set guifont=GohuFont\ 12,Terminus\ 12
  set guicursor=a:blinkon0
  set noantialias
  colorscheme clouds-midnight
  set lines=35 columns=100
else
  colorscheme supergirl " TODO: change it
endif

"
" Helper functions
"


" Delete trailing white space
function! DeleteTrailingWS()
  normal mz
  %s/\s\+$//ge
  normal `z
endfunction

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("find . -type f ! -path '*/.git/*' | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <silent> <c-f> :call DmenuOpen("e")<cr>

"
" Netrw
"


" Toggle Vexplore with F2
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <F2> :call ToggleVExplorer()<CR>

let g:netrw_winsize=20 " 20% of current window
let g:netrw_banner=0 " disable top panel
let g:netrw_browse_split = 4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_mousemaps=0


"
" Supertab
"

let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"


"
" UltiSnips
"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" Tagbar
"
"
nmap <silent> <F8> :TagbarToggle<CR>

let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
"let g:tagbar_compact = 1

set tags=./tags;/ "TODO: configure tags
