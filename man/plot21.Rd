\name{plot21}
\alias{plot21}

\title{
Plot function for bw21 object.
}
\description{
A plot of conditional survival curves is produced, one curve for each category of vartimes1.
}
\usage{
plot21(bw21 = NA,\dots)
}

\arguments{
  \item{bw21}{
An object of class \code{bwsurvival}, returned by the \code{bw21} function.
}
  \item{\dots}{
Other arguments to be passed to the generic plot function.
}
}

\author{
C. Serrat, G. Gomez and V. Moneta
}

\seealso{
\code{\link{bw21}}
}

\examples{
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
}
