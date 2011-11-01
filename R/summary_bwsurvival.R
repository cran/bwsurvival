summary_bwsurvival <-
function(bwsurvival,timesofinterest){
if(length(bwsurvival)==14) {result<- table(bwsurvival,timesofinterest)
cat("Survival conditional for especif times: ", "\n")} else

{result<- lapply(1:length(bwsurvival),function(param){
table(bwsurvival[[param]],timesofinterest)
})
names(result)<-names(bwsurvival)

cat("Survival conditional for especif times ", "\n") 

}
return(result)
}

