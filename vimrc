

" enable plugins
:filetype plugin on

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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

" my key mappings.. (if they arent used)
" undo using ctrl+z and ctrl+y
:map <C-z> <C-O>u
:map <C-y> <C-O><C-r>
" audvelt ad skilgr func breytu
:imap <C-f> = function () {<CR>}<Left><CR><Up><Tab>
" mappa NN og PP a ad hoppa a milli buffera
:map NN :bn!<CR>
:map PP :bp!<CR>
:imap NN <C-O>:bn!<CR>
:imap PP <C-O>:bp!<CR>







