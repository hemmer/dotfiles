

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
highlight SpellBad  term=Reverse ctermbg=236
highlight SpellRare term=Reverse ctermbg=236
highlight SpellCap  term=Reverse ctermbg=236


" custom expander for figure
let g:Tex_Env_figure = "\\begin{figure}[h!]\<CR>\\centering\<CR>\\includegraphics[width=<++>\\textwidth]{<++>}\<CR>\\caption{<++>}\<CR>\\label{fig:<++>}\<CR>\\end{figure}"

" turn off Syntastic (it's too sensitive)
let g:syntastic_tex_checkers=['']


" type of latex
let g:tex_flavour = 'latex'
set suffixes+=.log,.aux,.bbl,.blg,.idx,.ilg,.ind,.out,.pdf


let b:tex_flavor = 'pdflatex'
let g:Tex_BIBINPUTS = '~/papers/bibtex'
compiler tex
set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
set errorformat=%f:%l:\ %m


" we don't want these in tab complete in latex
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*.agr,*.eps,*.log
set wildignore+=*.fls,*.aux,*.blg,*.toc,*.out,*.bbl,*.lof
set wildignore+=*.fdb_latexmk
let g:ctrlp_custom_ignore = {'file': '\v\.(log|aux|fls|div|ps|pdf)$'}


" Arpeggio doesn't work with latex for some reason
" so apply this mapping manually here
inoremap kj <Esc>
inoremap jk <Esc>


" F7 (the default mapping) is used for folding so remap
" command completion to F6 instead
imap <silent> <buffer> <F3> <Plug>Tex_FastCommandInsert
nmap <silent> <buffer> <F3> <Plug>Tex_FastCommandInsert
imap <silent> <buffer> <S-F3> <Plug>Tex_FastCommandChange
nmap <silent> <buffer> <S-F3> <Plug>Tex_FastCommandChange
vmap <silent> <buffer> <F3> <Plug>Tex_FastCommandInsert

" add useful prefixes to labels
let g:Tex_EnvLabelprefix_equation = "eq:"
let g:Tex_EnvLabelprefix_align = "eq:"
let g:Tex_EnvLabelprefix_table = "tab:"
let g:Tex_EnvLabelprefix_figure = "fig:"
let g:Tex_EnvEndWithCR = 1


" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
setlocal iskeyword+=:,-

" replace latex symbols with unicode equivelent
set conceallevel=2
let g:tex_conceal= 'agm'
