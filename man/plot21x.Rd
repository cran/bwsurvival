\name{plot21x}
\alias{plot21x}

\title{
Plot function for bw21x
}
\description{
A plot of conditional survival curves is produced, one curve for each category of vartimes1. This plot is repeated for each category of covariable x.
}
\usage{
plot21x(bwsurvival=NA, x=NA , \dots)
}

\arguments{
  \item{bwsurvival}{
An object of class \code{bwsurvival}, returned by the \code{bw21x} function.}
  \item{x}{
A covariable with 2 or more categories}
\item{\dots}{
		Other arguments to be passed to the generic plot function.
}
}
\author{
C. Serrat, G. Gómez and V. Moneta
}

\seealso{
\code{\link{bw21x}}
}

\examples{
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
}



