categ <-
function(data,breaks) 
{
classdata<-NULL
n <- length(data)
classdata <- rep(0., n)
for(i in 1.:n)
classdata[i] <- sum(breaks < data[i]) + 1.
classdata
return(classdata)
}

