execute pathogen#infect()
set nocompatible
set viminfo^=!
filetype plugin indent on
set ruler
set ignorecase
set wrap
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent

set showmatch
set mat=5
set fileformat=unix

syntax on
set number
let g:syntastic_python_checkers=['pyflakes']

colorscheme desert

set backup

"
" Don't create backup files in current directory. Create it in
" $HOME/vim/backup
"
function! BackupDir()
  let l:backupdir=$HOME.'/vim/backup/'.
    \substitute(substitute(expand('%:p:h'), '^'.$HOME, '~', ''), ':\', '\', '')

  if !isdirectory(l:backupdir)
    call mkdir(l:backupdir, 'p', '0700')
  endif

  let &backupdir=l:backupdir

  let &backupext=strftime('~%Y-%m-%d~')
endfunction

autocmd! bufwrite * call BackupDir()

"
" Provides copying full file name to system buffer
"
function! FilePathToBuffer()
  let @*=expand('%:p')
endfunction

map <C-k><C-p> :execute FilePathToBuffer()<CR>

"
" Show/hide NERDTree panel
"
map <C-n> :NERDTreeToggle<CR>

"
" Show/hide function list panel
"
map <F2> :Flisttoggle<CR>


"
" Statusline settings
"
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

set laststatus=2
if has('statusline')
  set statusline=%#Question#
  set statusline+=%{GitBranch()}               " current git branch
  set statusline+=%#WarningMsg#
  set statusline+=%f\                          " file name
  set statusline+=%#Question#                  " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang},               " language of spelling checker
  set statusline+=%{SyntaxItem()}              " syntax highlight group under cursor
  set statusline+=%=                           " ident to the right
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=%-7.(%l,%c%V%)\ %<%P         " cursor position/offset
endif
