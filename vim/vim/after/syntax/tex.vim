

syn region texRefZone		matchgroup=texStatement start="\\\(figs\|apx\|chap\|chaps\|tab\|sec\|secs\|fig\|eqs\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup
