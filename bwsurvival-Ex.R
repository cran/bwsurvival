pkgname <- "bwsurvival"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('bwsurvival')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("bw21")
### * bw21

flush(stderr()); flush(stdout())

### Name: bw21
### Title: Conditional survival for T2 given categories of T1
### Aliases: bw21

### ** Examples

#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1
,TFW=TFW,DFW=DFW))



cleanEx()
nameEx("bw21x")
### * bw21x

flush(stderr()); flush(stdout())

### Name: bw21x
### Title: Conditional survival for T2 given categories of T1 adjusted for
###   x
### Aliases: bw21x

### ** Examples

#Load data#
data(times)
#Run the function#
survbw_x<-with(times,bw21x(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1
,TFW=TFW,DFW=DFW,x=treat))



cleanEx()
nameEx("plot21")
### * plot21

flush(stderr()); flush(stdout())

### Name: plot21
### Title: Plot function for bw21 object.
### Aliases: plot21

### ** Examples

#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365)
,wmet = 1,TFW=TFW,DFW=DFW))
#Plot of conditional survival#
x11()
par(font=1,font.axis=1,font.lab=4,las=1)
plot21(survbw,xlab='Days',axes=FALSE,ylab="Survival",lwd=2,col = 1:4
,lty=1:4, main="Stratified Conditional Survival of T2 given categories in T1")
axis(1,at=seq(0,2555,365))
axis(2,at=seq(0,1,.1))



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("plot21x")
### * plot21x

flush(stderr()); flush(stdout())

### Name: plot21x
### Title: Plot function for bw21x
### Aliases: plot21x

### ** Examples

#Load data#
data(times)
#Run the function#
survbw_x<-with(times,bw21x(days2,cens2,days1,cens1,breaks = c(180,365)
,wmet = 1,TFW=TFW,DFW=DFW,x=treat))
#Plot conditional survival ajusted by treatment#
plot21x(survbw_x,times$treat, xlab="Survival Time (in days)",
ylab="Proportion Surviving")
title(main="Stratified Conditional Survival of a second 
time given categories in T1",outer=TRUE)



cleanEx()
nameEx("plot_bwsurvival")
### * plot_bwsurvival

flush(stderr()); flush(stdout())

### Name: plot_bwsurvival
### Title: Plot for bwsurvival object. This function can be used with
###   'bw21' or 'bw21x' object.
### Aliases: plot_bwsurvival

### ** Examples

#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1,TFW=TFW,DFW=DFW))
#Plot of conditional survival#
x11()
par(font=1,font.axis=1,font.lab=4,las=1)
plot_bwsurvival(survbw,xlab='Days',axes=FALSE,ylab="Survival",lwd=2,col = 1:4
,lty=1:4, main="Stratified Conditional Survival of T2 given categories in T1")
axis(1,at=seq(0,2555,365))
axis(2,at=seq(0,1,.1))



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("summary_bwsurvival")
### * summary_bwsurvival

flush(stderr()); flush(stdout())

### Name: summary_bwsurvival
### Title: Conditional survival for times of interest of T2 given
###   categories of T1
### Aliases: summary_bwsurvival

### ** Examples

#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1
,TFW=TFW,DFW=DFW))
#Summary -  Conditional survival for especific values of days2: 10, 35 and 100 days.
summary_bwsurvival(survbw,c(10,35,100))



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
