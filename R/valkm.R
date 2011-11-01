valkm <-
function(km, x = 0.)
{
#km is a survfit object (not a kaplanMeier object)
neval <- length(x)
result <- rep(NA, neval)
if(!is.list(km))
result <- rep(km, neval)
else {
index <- pos(x, km$time)
nt <- length(km$time)
for(i in 1.:neval) {
if(index[i] == 0.)
result[i] <- 1.
else if(index[i] < nt)
result[i] <- km$surv[index[i]]
else if(x[i] == km$time[nt])
result[i] <- km$surv[nt]
else result[i] <- NA
}
}
result
}

