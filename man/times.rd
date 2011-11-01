\name{times}
\alias{times}
\docType{data}
\title{Successive times to discontinuation of first and second treatment}
\description{
Data from a cohort of schizophrenic patients. Time from starting treatment to first change and second change has been measured. 
Dataset include treatment baseline and censoring indicator variables.
This data set gives the times (in days) of 99 subjects who change the first and the second treatment
}
\usage{data(times)}

\format{
	A dataframe containing 99 observations on the following 8 variables:
 \describe{
     \item{\code{id}}{ID Patient}
     \item{\code{days1}}{Time to discontinuation the first treatment}
     \item{\code{cens1}}{Censoring indicator (0 = exact data, 1 = right censored) for de first time}
     \item{\code{days2}}{Time to discontinuation between the first and the second treatment}
     \item{\code{cens2}}{Censoring indicator (0 = exact data, 1 = right censored) for de second time}
     \item{\code{TFW}}{Follow-up time total}
     \item{\code{DFW}}{Censoring indicator for TWF}
     \item{\code{x}}{Treatment at baseline}
     }
}
\seealso{
	\code{\link{bwsurvival-package}}
	}
\keyword{datasets}







