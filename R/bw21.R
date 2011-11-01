bw21 <-
function(vartimes2, varcens2, vartimes1, varcens1, breaks,wmet=1,TFW=vartimes1+vartimes2,DFW=(1-varcens1*varcens2))
{
result<-list(breaks = breaks, counts = NA, times1 = NA, K1 = NA, times2 = NA, K2 = NA, cT1 = NA,
 events2c1 = NA, steps2c1 = NA, wmet = wmet, wd = NA, wr = NA, wlambda = NA,s2c1 = NA)

library(survival)


#chek of variables#

if(length(vartimes2) != length(varcens2) | length(vartimes2) != length(vartimes1) | length(vartimes2) != length(varcens1) | length(vartimes2) != length(TFW) | length(vartimes2) != length(DFW) )
stop("All variables vectors must have the same length.")

#chek of wmet#
if(wmet != 0 & wmet != 1)
stop("Weighting method must take values 0(non-weighted) or 1(weighted).")

#chek of breaks#
if(anyDuplicated(breaks)>0 | is.unsorted(breaks)==TRUE)
stop("Particion values are duplicated or unsorted")

#Correction NA#

vartimes2<-ifelse(is.na(vartimes2),0,vartimes2)
varcens2<-ifelse(is.na(varcens2),0,varcens2)


#start of function
result$counts <- count(vartimes1, breaks)
s1KM <- survfit(Surv(vartimes1,varcens1) ~ 1)
s2KM <- survfit(Surv(vartimes2[vartimes2 > 0], varcens2[vartimes2 > 0]) ~ 1)
times1 <- s1KM$time[s1KM$n.event > 0]

#Warning about events of vartimes1
if(max(s1KM$n.event)==0) 
stop("There are no events in the variable vartimes1")

K1 <- length(times1)
times2 <- s2KM$time[s2KM$n.event > 0]
K2 <- length(times2)
nb <- length(breaks)
nc <- nb + 1
cT1 <- categ(vartimes1, breaks)
events2c1 <- 0
steps2c1 <- 0
for(m in 1:nc) {
events2c1 <- c(events2c1, sum(varcens2[vartimes2 > 0 & cT1 == m]))
steps2c1 <- c(steps2c1, length(intersect(times2[vartimes2 > 0], vartimes2[varcens2 == 
1 & cT1 == m])))
}
result$events2c1 <- events2c1[2:(nc + 1)]
result$steps2c1 <- steps2c1[2:(nc + 1)]
fkm <- switch(wmet + 1,
1,
survfit(Surv(TFW,DFW)~1))

wd21 <- matrix(NA, nrow = K2, ncol = nc)
wr21 <- matrix(NA, nrow = K2, ncol = nc)
for(j in 1:nc)
for(i in 1:K2){
vectord<- ((cT1 == j) * (varcens1 == 1) * (vartimes2 == 
times2[i]) * (varcens2 == 1)) 
vectorw<-valkm(fkm, vartimes1 + times2[i])
vectorwd<-ifelse(vectord==0,0,1/vectorw)
wd21[i, j]<-sum(vectorwd) 

vectorr<- ((vartimes2 >= times2[i]) * (cT1 == j) * (
varcens1 == 1)) # els varcens1==1 son redundants
vectorwr<-ifelse(vectorr==0,0,1/vectorw)
wr21[i,j]<-sum(vectorwr)
}
wlambda21 <- wd21/wr21
result$wd <- wd21
result$wr <- wr21
result$wlambda <- wlambda21
s2c1 <- matrix(NA, nrow = K2, ncol = nc)
colnames <- rep("", nc)
colnames[1] <- paste("(0,", breaks[1], "]", sep = "")
colnames[2:(nc - 1)] <- paste(paste("(", breaks[1:(nb - 1)], ",", sep = ""), 
paste(breaks[2:nb], "]", sep = ""), sep = "")
colnames[nc] <- paste("(", breaks[nb], ",Inf)", sep = "")
dimnames(s2c1) <- list(times2, colnames)
s2c1[1,  ] <- 1 - wlambda21[1,  ]
for(b in 2:K2)
s2c1[b,  ] <- s2c1[b-1,]*(1-wlambda21[b,])

result$wmet<-wmet
result$breaks<-breaks
result$s2c1 <- s2c1
result$times1<-times1
result$times2<-times2
result$K1<-K1
result$K2<-K2
result$cT1<-cT1
class(result)<- "bwsurvival"
return(result)
}

