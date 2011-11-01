count <-
function(data,breaks)
{
n <- length(data)
nc <- length(breaks) + 1.
classdata <- rep(0., n)
counts <- rep(0., nc)
data <- sort(data)
for(i in 1.:n) {
classdata[i] <- sum(breaks < data[i]) + 1.
counts[classdata[i]] <- counts[classdata[i]] + 1.
}
return(counts)
}

