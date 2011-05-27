all pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" enable plugins
:filetype plugin on
" tabstops..
:set tabstop=4
:set sw=4
" set c-style indenting according to brackets - for autoindent magic
:set cindent
" choose a better font
:set guifont=Inconsolata:h14
" show line numbers
:set number

" start maximized:
au GUIEnter * simalt ~x

set encoding=utf-8

" don't want lines to wrap...
:set nowrap

