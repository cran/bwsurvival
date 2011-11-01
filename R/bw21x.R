bw21x <-
function(vartimes2, varcens2, vartimes1, varcens1, breaks = c(8,45,90,180,365),wmet=1,TFW=vartimes1+vartimes2,DFW=(1-varcens1*varcens2),x){

#chek of variables#

if(length(vartimes2) != length(varcens2) | length(vartimes2) != length(vartimes1) | length(vartimes2) != length(varcens1) | length(vartimes2) != length(TFW) | length(vartimes2) != length(DFW) )
stop("All variables vectors must have the same length.")

#chek of wmet#
if(wmet != 0 & wmet != 1)
stop("Weighting method must take values 0(non-weighted) or 1(weighted).")

#chek of breaks#
if(anyDuplicated(breaks)>0 | is.unsorted(breaks)==TRUE)
stop("particion values are duplicated or unsorted")

#Correction NA#

vartimes2<-ifelse(is.na(vartimes2),0,vartimes2)
varcens2<-ifelse(is.na(varcens2),0,varcens2)


#Transform x in factor#
x<-factor(x) 

resultado <- lapply(levels(x),function(level){

bw21(vartimes2[x==level], varcens2[x==level], vartimes1[x==level], varcens1[x==level], breaks ,wmet= 1,TFW[x==level],DFW[x==level])

})

name<-NULL
for (i in 1:nlevels(x))
names(resultado)<-c(name,paste(levels(x),sep=""))
return (resultado)

}

