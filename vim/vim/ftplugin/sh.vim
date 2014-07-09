" bash header
if getline(1) == "" 
	:call setline(1, "#!/bin/bash")
endif
