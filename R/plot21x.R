plot21x <-
function(bwsurvival=NA,x=NA,...){
library(Hmisc)
x<-factor(x)
if (length(bwsurvival)%%2==0) par(mfrow=c(floor(length(bwsurvival)%/%2),2),font=1,font.axis=3,font.lab=4,las=1,oma=c(0,0,1,0)) else
par(mfrow=c(floor(length(bwsurvival)%/%2+1),2),font=1,font.axis=3,font.lab=4,las=1,oma=c(0,0,1,0))
plot(bwsurvival[[1]]$times2, bwsurvival[[1]]$s2c1[,1], col=1,lty=1, lwd=2, type="s",xlim=c(0,max(bwsurvival[[1]]$times2)), ylim=c(0,1),main=paste("",levels(x)[[1]],sep=""),...)
axis(2,at=seq(0,1,.1))
if (bwsurvival[[1]]$wmet==0) title(main="  \n \n (Non-weighted methodology)", outer=T) else title(main="  \n \n (Weighted methodology)", outer=T)
for (i in 1:ncol(bwsurvival[[1]]$s2c1)){
lines(bwsurvival[[1]]$times2, bwsurvival[[1]]$s2c1[,i], col=i, lty=i, lwd=2,type="s")
legend('topright',colnames(bwsurvival[[1]]$s2c1),col=1:100,lty=1:100,lwd=2,box.lwd=1)
}

for (j in 2:length(bwsurvival)){
plot(bwsurvival[[j]]$times2, bwsurvival[[j]]$s2c1[,1], col=j,lty=j, lwd=2,type="s", xlim=c(0,max(bwsurvival[[j]]$times2)),ylim=c(0,1),main=paste("",levels(x)[[j]],sep=""),...)
for (i in 1:ncol(bwsurvival[[1]]$s2c1)){
lines(bwsurvival[[j]]$times2, bwsurvival[[j]]$s2c1[,i], col=i, lty=i, lwd=2,type="s")
}
legend('topright',colnames(bwsurvival[[1]]$s2c1),col=1:i,lty=1:100,lwd=2,box.lwd=1)
}
axis(2,at=seq(0,1,.1))
}

