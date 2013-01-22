" dont map keys for TeXPDF
let g:tex_pdf_map_keys = 0 
" no spellchecking in comments
let g:tex_comment_nospell= 1

" allow sensible wrapping
set wrap
set linebreak

" turn on spell checking
set spell
highlight SpellBad term=Reverse ctermbg=236 
highlight SpellRare term=Reverse ctermbg=236 
highlight SpellCap term=Reverse ctermbg=236 

 noremap <silent> <F12> :w<CR>:make %<CR><CR><CR>k
inoremap <silent> <F12> <Esc>:w<CR>:make %<CR><CR><CR>k


let b:tex_flavor = 'pdflatex'
let g:Tex_BIBINPUTS = '~/papers/'
compiler tex
set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
set errorformat=%f:%l:\ %m

"au BufWritePost *.tex silent :!latex note
"au BufWritePost *.tex silent !pkill -USR1 xdvi.bin

