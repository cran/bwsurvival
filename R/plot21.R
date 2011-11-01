plot21 <-
function(bw21=NA,...){
library(Hmisc)
maxt2<-max(bw21$times2)
plot(bw21$times2, bw21$s2c1[,1],type="s",xlim=c(0,maxt2),...,)
if (bw21$wmet==0) title(main=paste(" ","  (Non-weighted methodology)", sep="  \n \n")) else title(main=paste(" ","   (Weighted methodology)", sep="  \n \n"))
for (i in 1:ncol(bw21$s2c1)){
lines(bw21$times2, bw21$s2c1[,i], col=i, type="s", lwd=2)
legend('topright',colnames(bw21$s2c1),col=1:100,lwd=2,box.lwd=1)
}
}

