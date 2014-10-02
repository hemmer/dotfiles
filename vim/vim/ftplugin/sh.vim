
" bash header
if getline(1) == ""
	:call setline(1, "#!/bin/bash")
	:call setline(2, "set -o errexit")
	:call setline(3, "set -o nounset")
	:call setline(4, "source ~/.bash_aliases")
endif
