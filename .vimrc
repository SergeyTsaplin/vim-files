"" .vimrc vim configuration file
"" actual version always available on https://github.com/SergeyTsaplin/vim-files
""==================================================================================================

" Pathogen plugin on
execute pathogen#infect()

"
" Base settings
"
set nocompatible  " vi compatible off
set viminfo^=!
set ignorecase
set mouse=a       " mouse on
set mousehide     " hide mouse in edit mode
set showmatch     " show left bracket when the right entered
set autoread      " reload changed files automaticaly
set t_Co=256      " use 256 colors in coonsole
" reload configuration automaticaly
"autocmd! bufwritepos $MYVIMRC source $MYVIMRC

set number
set backspace=indent,eol,start

"
" wrap settings
"
set wrap      "wrap long strings
set linebreak "wrap whole words


"
" Identation settings
"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set smartindent
au FileType crontab,fstab,make set noexpandtab tabstop=4 shiftwidth=4
set pastetoggle=

set showmatch
set mat=5
set fileformat=unix

let g:syntastic_python_checkers=['pyflakes']

"
" Syntax highlightning
"
filetype plugin indent on
syntax on
colorscheme desert
highlight SpellBad ctermfg=Black ctermbg=Red
" Hilights words matched with word under cursor
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))


"
" Highlight trailing spaces
"
set list
set listchars=tab:>-,trail:-

"
" Don't create swap files
"
set noswapfile

"
" GUI settings
"
if has('gui')
  set guioptions-=T " Button panel off

  if has('win32')
    set guifont=Lucida_Console:h10:cRUSSIAN::
  else
    set guifont=Terminus\ 10
  endif
endif

"
" File settings
"
if has('win32')
  set encoding=cp1251
  set fencs=cp1251,utf8,cp866
else
  set encoding=utf8
  set termencoding=utf8
  set fencs=utf8,cp1251,cp866
endif
set fileformat=unix

"
" Keymap settings
"
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
function! MyKeyMapHighlight()
  if &iminsert == 0
    hi StatusLine ctermfg=White guifg=White
  else
    hi StatusLine ctermfg=DarkRed guifg=DarkRed
  endif
endfunction


"
" Don't create backup files in current directory. Create it in
" $HOME/vim/backup
"
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
" NerdCommenter shortcuts
"

map <C-b>, \c space
nmap <C-b>, \c space
imap <C-b>, \c space


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
set noruler "ruler off cause we already have mega status line

"
" Tab manipulating
"
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
nnoremap <C-F4>  :tabclose<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

"
" Remove trail spaces
"
function! RemoveTrailSpaces()
  normal! mzHmy
  execute '%s:\s\+$::ge'
  normal! 'yzt`z
endfunction

"
" Hot keys
"
nnoremap <silent> <F3> :Rgrep<cr>   " Recursive search on F3
