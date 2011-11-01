\name{bwsurvival-package}
\alias{bwsurvival-package}
\docType{package}
\title{
Nonparametric conditional survival function for successive survival times
}
\description{
This R package implements the conditional survival function described at \sQuote{Nonparametric bivariate estimation for
successive survival times} (C. Serrat and G. Gómez, 2007).
}
\details{
When one event precedes the second, the censoring mechanism acting on the second and subsequent times will depend not only on the
total time of follow-up but also in the value of the first and preceding times. When this situation arises the methods to estimate the joint survival, or functions of the joint,
have to handle the special case of dependent and informative censoring induced by the previous failure times.
Assume that \eqn{T_1}{T1} and \eqn{T_2}{T2} represent two consecutive duration variables corresponding to
two different events at times \eqn{T_1}{T1} and \eqn{T_1}{T1} + \eqn{T_2}{T2}, respectively, which are measured from the
start of the follow-up. The follow-up time is subject to independent right censoring by
C. Note that \eqn{T_1}{T1}, \eqn{T_2}{T2} and \eqn{T_1}{T1} + \eqn{T_2}{T2} are independent of C. However \eqn{T_2}{T2}, which is subject
to right censoring by C - \eqn{T_1}{T1}, is not independent of C - \eqn{T_1}{T1} unless \eqn{T_1}{T1} is independent
of \eqn{T_1}{T1}. In this situation, we cannot use conventional survival methods for independent or
noninformative censorship models.Whenever the censoring random variable for a given
time depends on other random times we say that we are in the framework of a dependent
censoring mechanism.
}


\author{
C. Serrat, G. Gómez and V. Moneta
}

\references{
Serrat, C., Gómez, G. (2007) Nonparametric bivariate estimation for successive survival times. 
\emph{SORT, Statistics and Operations Research Transactions}, \bold{31}, 75-96.
}

\keyword{ package }
\seealso{
\code{\link{bw21}}
}