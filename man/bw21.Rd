\name{bw21}
\alias{bw21}
\title{
Conditional survival for \eqn{T_2}{T2} given categories of \eqn{T_1}{T1}
}
\description{
This function returns a list with 14 elements. Last of them is the noparametric survival function for \eqn{T_2}{T2} given 
categories of \eqn{T_1}{T1}. The proposed estimator for the survival function uses the risk group of \eqn{T_2}{T2} conditioned on the categories of
\eqn{T_1}{T1}, and corrects for the dependent censoring using weights defined by the observed values of \eqn{T_1}{T1}.
}
\usage{
bw21(vartimes2, varcens2, vartimes1, varcens1, breaks, wmet = 1, 
TFW = vartimes1 + vartimes2, DFW = (1 - varcens1 * varcens2))
}
\arguments{
  \item{vartimes2}{
	a vector of length n of survival times between the first and second event.
}
  \item{varcens2}{
	a vector of length n of censoring indicator (0 = exact data, 1 = right censored) for de second time (vartimes2).
}
  \item{vartimes1}{
a vector of length n of survival times to the first event.
}
  \item{varcens1}{
	a vector of length n of censoring indicator (0 = exact data, 1 = right censored) for de first time (vartimes1).
}
  \item{breaks}{
partition values of the first time (vartimes1).
}
  \item{wmet}{
weighting method for the dependent censoring (0 = not-weighted, 1 = weighted) For default it is 1.
}
  \item{TFW}{
a vector of length n of survival times total. For default it is  (vartimes1 + vartimes2).
}
  \item{DFW}{
a vector of length n of censoring indicator. For default it is (1 - varcens1 * varcens2).
}
}
\value{
A list with the following items:
\item{breaks}{partition values of the first time (vartimes1)}
\item{counts}{frecuency of each category of vartimes1}
\item{times1}{values of vartimes1 where was event}
\item{K1}{number of event in vartimes1}
\item{times2}{values of vartimes2 where was event}   
\item{K2}{number of event in vartimes1}
\item{cT1}{represents levels of categories of vartimes1 }
\item{events2c1}{number of events in each category of vartimes1}
\item{steps2c1}{number of steps in each category of vartimes1}
\item{wmet}{weighting method used for the dependent censoring}
\item{wd}{weighted number of vartimes2 events in each category of vartimes1}
\item{wr}{weighted number of subjects at risk for vartimes2 in each category of vartimes1}
\item{wlambda}{wr/wd: weighted risk of failure for vartimes2 in each category of vartimes1}
\item{s2c1}{a matrix with K2 rows where each columm is a category of vartimes1. 
Each one has a conditional survival of vartimes2 given categories of vartimes1}
}
\author{
C. Serrat, G. Gomez and V. Moneta
}

\references{
Serrat, C., Gómez, G. (2007) Nonparametric bivariate estimation for successive survival times. 
\emph{SORT, Statistics and Operations Research Transactions}, \bold{31}, 75--96.
}

\seealso{
	\code{\link{bwsurvival-package}}
}

\examples{
#Load data#
data(times)
#Run the function#
survbw<-with(times,bw21(days2,cens2,days1,cens1,breaks = c(180,365),wmet = 1
,TFW=TFW,DFW=DFW))
}



