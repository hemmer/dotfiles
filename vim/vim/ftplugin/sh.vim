
" if the bash file is empty, add some useful
" parts to the top
if getline(1) == ""
	:call append(0, "#!/usr/bin/env bash")
	:call append(1, "set -o errexit      # exit on error")
	:call append(2, "set -o nounset      # exit undeclared var used")
	:call append(3, "source ~/.bash_aliases")
endif

call Iab('forfin', 'mkdir -p dat<CR>rm -fr dat/*<CR><CR>for f in N*; do<CR>cd $f<CR>if ! outputDataExists; then cd .. && continue; fi<CR><CR>cd ..<CR>done<Up><Up>')
