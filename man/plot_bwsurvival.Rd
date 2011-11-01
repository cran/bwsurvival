\name{plot_bwsurvival}
\alias{plot_bwsurvival}

\title{
Plot for bwsurvival object. This function can be used with \code{bw21} or \code{bw21x} object.
}
\description{
A plot of conditional survival curves is produced, one curve for each category of vartimes1. If the object is from \code{bw21x} function, will be 
as many plots as the covariate categories.
}

\usage{
plot_bwsurvival(bwsurvival = NA, x = NA,\dots)
}

\arguments{
  \item{bwsurvival}{
An object of class \code{bwsurvival}, returned by the \code{bw21} or \code{bw21x} function.
}
  \item{x}{
A covariable \eqn{x} with 2 or more categories
}
\item{\dots}{
		Other arguments to be passed to the generic plot function.
}
}

\author{
C. Serrat, G. Gómez and V. Moneta
}

\seealso{
\code{\link{bw21}}, \code{\link{plot21}}, \code{\link{bw21x}}, \code{\link{plot21x}} 
}

\examples{
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
}
