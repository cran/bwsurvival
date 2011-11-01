pos <-
function(data, seq)
{
n <- length(data)
np <- length(seq)
vectorpos <- rep(0., n)
for(i in 1.:n)
vectorpos[i] <- sum(seq <= data[i])
return(vectorpos)
}

