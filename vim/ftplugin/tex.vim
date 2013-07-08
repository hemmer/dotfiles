" dont map keys for TeXPDF
let g:tex_pdf_map_keys = 0
" no spellchecking in comments
let g:tex_comment_nospell= 1

let loaded_tex_syntax_checker=0

" allow sensible wrapping
set wrap
set linebreak

" turn on spell checking
set spell
highlight SpellBad term=Reverse ctermbg=236
highlight SpellRare term=Reverse ctermbg=236
highlight SpellCap term=Reverse ctermbg=236

" turn off Syntastic (it's too sensitive)
SyntasticToggleMode


let b:tex_flavor = 'pdflatex'
let g:Tex_BIBINPUTS = '~/papers/'
compiler tex
set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
set errorformat=%f:%l:\ %m

