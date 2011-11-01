\name{summary_bwsurvival}
\alias{summary_bwsurvival}
\title{
Conditional  survival for times of interest of \eqn{T_2}{T2} given categories of \eqn{T_1}{T1} 
}
\description{
This function returns values of conditional survival given categories of \eqn{T_1}{T1} for especif values of \eqn{T_2}{T2}. 
}

\usage{
summary_bwsurvival(bwsurvival, timesofinterest)
}

\arguments{
  \item{bwsurvival}{
An object of class bwsurvival, returned by the \code{bw21} or \code{bw21x} function.
}
  \item{timesofinterest}{
A list of values of \eqn{T_2}{T2}
}
}

\value{
A matrix with values of the conditional survival where the rows corresponds to especific values of \eqn{T_2}{T2} 
and the columns corresponds to categories of \eqn{T_1}{T1}.
}

\references{
Serrat, C., Gómez, G. (2007) Nonparametric bivariate estimation for successive survival times. 
\emph{SORT, Statistics and Operations Research Transactions}, \bold{31}, 75--96.
}

\author{
C. Serrat, G. Gómez and V. Moneta
}

\seealso{
\code{\link{bw21}}, \code{\link{bw21x}}
}

\examples{
#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1
,TFW=TFW,DFW=DFW))
#Summary -  Conditional survival for especific values of days2: 10, 35 and 100 days.
summary_bwsurvival(survbw,c(10,35,100))
}