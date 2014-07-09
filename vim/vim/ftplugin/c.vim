
set showmatch 	" show matching parentheses

" indents after pasting by default
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v']=
nnoremap P P'[v']=

" LAPACK and BLAS should be included in syntax check
let g:syntastic_c_checker="-llapac -lblas -fftw3"

" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~

"""""""""""""""""""""
" C/C++ Keymappings "
"""""""""""""""""""""
" run program
 map <F5> :make exec<CR>
imap <F5> <Esc> :make exec<CR>

" compile using make
 noremap <F9> :silent make<CR>:redraw!<CR>
inoremap <F9> <Esc> :silent make<CR>:redraw!<CR>
"inoremap <F9> <Esc> :make<CR><CR>
" clean using make
 noremap <C-F9> :make clean<CR><CR>
inoremap <C-F9> <Esc> :make clean<CR><CR>

" generate ctags for directory of active buffer
nnoremap <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q "%:p:h"<CR>


" open taglist browser
 map <silent> <F12> :TlistToggle<CR><C-h>
imap <silent> <F12> <Esc>:TlistToggle<CR><C-h>

" close vim if taglist browser is all thats left
let Tlist_Exit_OnlyWindow = 1

" hide omnicomplete scratch pane
set completeopt=menu

autocmd BufWritePre *.c :%s/\s\+$//e

""""""""""""""""""""""
" Replacement macros "
""""""""""""""""""""""

call Iab('#d', '#define ')
call Iab('#i', '#include <><Left>')
call Iab('#I', '#include ""<Left>')
call Iab('printf', 'printf ("\n");<C-O>?\<CR>')
call Iab('fprintf', 'fprintf (stderr, "\n");<C-O>?\<CR>')
call Iab('printboth', 'printboth ("\n");<C-O>?\<CR>')
call Iab('if', 'if ()<Left>')
"call Iab('if', 'if ()<CR>{<CR>}<Left><C-O>?)<CR>')
call Iab('for', 'for (;;)<CR><C-O>?;;<CR>')
call Iab('forij', 'for (int i = 0; i < Nx; ++i)<CR>for (int j = 0; j < Ny; ++j)<CR>{<CR>}<Up><CR>')
call Iab('while', 'while ()<CR>{<CR>}<C-O>?)<CR>')
"call Iab('else', 'else<CR>{<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
call Iab('ifelse', 'if ()<CR>{<CR>}<CR>else<CR>{<CR>}<C-O>?)<CR>')
call Iab('intmain', 'int<CR>main (int argc, char **argv)<CR>'.
 \ '{<CR>x;<CR>return 0;<CR>}<CR><C-O>?x;<CR><Del><Del>')

" solution from: http://groups.google.com/group/vim_dev/msg/ed4f258f5b4b9749
"set errorformat^=%-GIn\ file\ included\ %.%#
"http://stackoverflow.com/questions/9427141/vim-tries-to-jump-to-nonexistent-file-after-make
set errorformat^=%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file
         \\ included\ from\ %f:%l:%c\\,,%-GIn\ file\ included\ from\ %f
         \:%l:%c,%-GIn\ file\ included\ from\ %f:%l

set mp=(make\ clean\ &&\ make)

" allow sensible code folding
set foldmethod=syntax
