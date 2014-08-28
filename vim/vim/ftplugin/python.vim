" Execute file being edited with <F5>
 noremap <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
inoremap <buffer> <F5> <ESC>:w<CR>:!/usr/bin/env python % <CR>
" And time if <CTRL> is used
 noremap <buffer> <C-F5> :w<CR>:!time /usr/bin/env python % <CR>
inoremap <buffer> <C-F5> <ESC>:w<CR>:!time /usr/bin/env python % <CR>

" good whitespace settings for python
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal nosmartindent
setlocal showmatch

set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Python header
if getline(1) == ""
    :call setline(1, "#!/usr/bin/env python")
endif


let python_highlight_all = 1

" syntax for the pylint plugin
highlight SpellBad term=Reverse ctermbg=238


set makeprg=pep8\ --repeat\ %

let g:pyflakes_use_quickfix = 0

" compile using make
 map <F9> :make<CR><CR>
imap <F9> <Esc> :make<CR><CR>


 map <buffer> <F8> za
imap <F8> <Esc>za


""""""""""""""""""""""
" Replacement macros "
""""""""""""""""""""""
call Iab('imnum', 'import numpy as np<CR>')
call Iab('impy', 'from pylab import *<CR>')
