
set showmatch 	" show matching parentheses

" indents after pasting by default
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v']=
nnoremap P P'[v']=

"""""""""""""""""""""
" C/C++ Keymappings "
"""""""""""""""""""""
" run program
 map <F5> :make exec<CR>
imap <F5> <Esc> :make exec<CR>

" autoindent whole file and centre screen
map <C-F8> m`:%!astyle<CR>``
imap <C-F8> <Esc>m`:%!astyle<CR>``

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
call Iab('printb', 'printboth ("\n");<C-O>?\<CR>')
call Iab('if', 'if ()<Left>')
"call Iab('if', 'if ()<CR>{<CR>}<Left><C-O>?)<CR>')
call Iab('for', 'for (;;)<CR><C-O>?;;<CR>')
"call Iab('for', 'for (;;)<CR>{<CR>}<C-O>?;;<CR>')
call Iab('while', 'while ()<CR>{<CR>}<C-O>?)<CR>')
"call Iab('else', 'else<CR>{<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
call Iab('ifelse', 'if ()<CR>{<CR>}<CR>else<CR>{<CR>}<C-O>?)<CR>')
call Iab('intmain', 'int<CR>main (int argc, char **argv)<CR>'.
 \ '{<CR>x;<CR>return 0;<CR>}<CR><C-O>?x;<CR><Del><Del>')

" solution from: http://groups.google.com/group/vim_dev/msg/ed4f258f5b4b9749
set errorformat^=%-GIn\ file\ included\ %.%# 

" allow sensible code folding 
:set foldmethod=syntax


" comment out undefined regions
syn region MySkip contained start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*#\s*endif\>" contains=MySkip

let g:CommentDefines = ""

hi link MyCommentOut2 MyCommentOut
hi link MySkip MyCommentOut
hi link MyCommentOut Comment

map <silent> ,a :call AddCommentDefine()<CR>
map <silent> ,x :call ClearCommentDefine()<CR>

function! AddCommentDefine()
  let g:CommentDefines = "\\(" . expand("<cword>") . "\\)"
  syn clear MyCommentOut
  syn clear MyCommentOut2
  exe 'syn region MyCommentOut start="^\s*#\s*ifdef\s\+' . g:CommentDefines . '\>" end=".\|$" contains=MyCommentOut2'
  exe 'syn region MyCommentOut2 contained start="' . g:CommentDefines . '" end="^\s*#\s*\(endif\>\|else\>\|elif\>\)" contains=MySkip'
endfunction

function! ClearCommentDefine()
  let g:ClearCommentDefine = ""
  syn clear MyCommentOut
  syn clear MyCommentOut2
endfunction
