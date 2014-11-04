

syn region texRefZone		matchgroup=texStatement start="\\\(figs\|tab\|sec\|fig\|eqs\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup
