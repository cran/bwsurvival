table<-function(bwsurvival,timesofinterest){
nb <- length(bwsurvival$breaks)
	nc <- nb + 1
table<- matrix(NA, nrow = length(timesofinterest), ncol = nc)
	colnames <- rep("", nc)
	colnames[1] <- paste("(0,", bwsurvival$breaks[1], "]", sep = "")
	colnames[2:(nc - 1)] <- paste(paste("(", bwsurvival$breaks[1:(nb - 1)], ",", sep = ""), 
	paste(bwsurvival$breaks[2:nb], "]", sep = ""), sep = "")
	colnames[nc] <- paste("(", bwsurvival$breaks[nb], ",Inf)", sep = "")
	dimnames(table) <- list(paste("T2=",timesofinterest,sep=""),colnames)
	a<-NULL
	for(i in 1:length(timesofinterest)){
	a<-max(bwsurvival$times2[bwsurvival$times2<=timesofinterest[i]])
	table[i,]<-bwsurvival$s2c1[bwsurvival$times2==a]
	}
return(table)
}
