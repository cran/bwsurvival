plot_bwsurvival <-
function(bwsurvival=NA,x=NA,...){
library(Hmisc)
if (length(bwsurvival)==14) return(plot21(bwsurvival,...))
else return(plot21x(bwsurvival,x,...))
}

