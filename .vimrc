let mapleader=","
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/a.vim'
Bundle 'tomasr/molokai'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/CmdlineComplete'
Plugin 'vim-scripts/mru.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved

"file encode
set fileformats=unix
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,big

"no backup
set nobackup 

" Use Unix as the standard file type
set ffs=unix

syntax enable
syntax on
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"ruler
set ru

"line number
set number

"line space
set linespace=1

"color theme
colorscheme vividchalk

" font setting
"set guifont=Envy\ Code\ R\ 10
set guifont=Monospace\ 9

"indent setting
set tabstop=4
set shiftwidth=4
set ai " autoindent
set si " smartindent

"highlight search
set hlsearch

"instant search
set incsearch

"ignorecase while searching
set ignorecase
set smartcase " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.

"expandtab
set expandtab

"Do not wrap long line
set nowrap

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"detect file type
filetype on

"indent by filetype
filetype indent on
filetype plugin indent on

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"viminfo
set viminfo+=! " make sure it can save viminfo
set viminfo='1000,f1,<200

"xterm
if &term =~ "xterm"
    set mouse=a
endif

"matching paren
set showmatch " show matching paren
set matchtime=0 " 0 second to show the matching paren ( much faster )

"auto read file modified by other program
set autoread

"highlighting current line
se cursorline

"highlight 80th column
set cc=100

"fast switch 
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

"move
inoremap <C-f> <Esc>la
inoremap <C-b> <Esc>i

"fold setting
function! FoldBrace()
  if getline(v:lnum+1)[0] == '{'
    return 1
  endif
  if getline(v:lnum) =~ '{'
    return 1
  endif
  if getline(v:lnum)[0] =~ '}'
    return '<1'
  endif
  return -1
endfunction

" code fold
set foldenable
set foldlevel=100
"set foldexpr=FoldBrace()
"set foldmethod=expr
set foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent

"fold by space
nmap <space> za

"no scrollbar
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b

set wildmenu " turn on wild menu, try typing :h and press <Tab>
set showcmd
set cmdheight=2

" disable menu & toolbar
set guioptions-=m
set guioptions-=T

if has("gui_running")
    set lines=43 columns=210
endif

"sudo
nmap <Leader>wsu :w !sudo tee %<cr> 

"Make
:command -nargs=* Make make <args> | bo cwindow 6

"grep
command! -nargs=+ Grep execute 'silent grep! <args>' | bo cw 6

"NerdTree
nmap wm :NERDTreeToggle<cr>

"tags
:command Up :!ctags -R ./* > /dev/null 2>&1 <cr><cr>
set tags+=./tags,./../tags,./**/tags,tags,./.tags,./../.tags,./**/.tags,.tags " which tags files CTRL-] will find

function! AutoLoadCTagsAndCScope()
    let max = 5
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out') 
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf
nmap <F9> :call AutoLoadCTagsAndCScope()<CR>

"Doxygen
nmap <Leader>dx :Dox<cr>
let g:DoxygenToolkit_authorName="Phonzia"
let g:DoxygenToolkit_briefTag_pre="@Brief "
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns "

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Disable auto-comment for c/cpp, lua, javascript, c# and vim-script
au FileType c,cpp,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
au FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f://
au FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
au FileType lua set comments=f:--

" bufexplore
noremap <silent> <F2> :BufExplorerVerticalSplit<CR>

