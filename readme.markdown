My vim configs
==============

Requirements
------------

This configuration required on follow plugins:
  * [Pathogen](https://github.com/tpope/vim-pathogen)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
  * [Syntastic](https://github.com/scrooloose/syntastic)
  * [tagbar](https://github.com/majutsushi/tagbar)
  * [python](https://github.com/vim-scripts/python.vim)
  * [django.vim](https://github.com/vim-scripts/django.vim)
  * [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
  * [vim-fugitive](https://github.com/tpope/vim-fugitive)

Installation
------------

  * On Linux/MacOS

        cd ~
        git clone https://github.com/SergeyTsaplin/vim-files.git ~/.vim
        ln -s ~/.vim/vimrc ~/.vimrc
        cd ~/.vim
        git submodule init
        git submodule update

  * On Windows

        cd %USERPROFILE%
        git clone https://github.com/SergeyTsaplin/vim-files.git vimfiles
        cp vimfiles\vimrc %USERPROFILE%\_vimrc
        cd vimfiles
        git submodule init
        git submodule update

How to update
-------------

    git submodule foreach git pull origin master

How to use
----------

This is basic hotkeys for features access:

* _Ctrl+n (&lt;C-n&gt;)_ toggle NERDTree panel
* _F2 (&lt;F2&gt;)_ toggle Tagbar panel
* _Ctrl+k Ctrl+p_ Puts full file path to system buffer
* _Ctrl+d (&lt;C-d&gt;)_ put next cursor on the same word (multiple cursors)
* _Ctrl+Tab_ switch to the next tabview
* _Ctrl+Shift+Tab_ switch to the previous tabview

Notices
-------

* [tagbar](https://github.com/majutsushi/tagbar) plugin required [ctags](http://ctags.sourceforge.net/) installed on your system
