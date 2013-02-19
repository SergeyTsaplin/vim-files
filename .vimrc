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

colorscheme desert

set backup

function! BackupDir()
  let l:backupdir=$HOME.'/vim/backup/'.
    \substitute(substitute(expand('%:p:h'), '^'.$HOME, '~', ''), ':\', '\', '')

  if !isdirectory(l:backupdir)
    call mkdir(l:backupdir, 'p', '0700')
  endif

  let &backupdir=l:backupdir

  let &backupext=strftime('~%Y-%m-%d~')
endfunction

function! FilePathToBuffer()
  let @*=expand('%:p')
endfunction

map <C-k><C-l> :execute FilePathToBuffer()<CR>
map <C-n> :NERDTreeToggle<CR>
map <F2> :Flisttoggle<CR>


autocmd! bufwrite * call BackupDir()

cd d:\home\tsaplins\branch\Tsaplin-SV
