% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ip-lookup.R
\name{ip_lookup}
\alias{ip_lookup}
\title{Perform "standard" IP lookup}
\usage{
ip_lookup(ip, fields = NULL, hostname = FALSE, security = FALSE,
  language = "en", ssl = FALSE,
  ipstack_api_key = Sys.getenv("IPSTACK_API_KEY"))
}
\arguments{
\item{ip}{IP address to lookup}

\item{fields}{When \code{NULL} all fields that the \code{ipstack_api_key} has access to
will be returned. Otherwise, specify a character vector of field names
according to the \href{https://ipstack.com/documentation#fields}{API reference}.}

\item{hostname}{By default, the \code{ipstack} API does not return information about
the hostname the given IP address resolves to. In order to include the
hostname object in your API result set this to \code{TRUE}.}

\item{security}{Customers subscribed to the "Professional Plus Plan" may access
the \code{ipstack} API's Security Module, which can be used to assess risks
and threats originating from certain IP addresses before any harm can be
done to a website or web application. In order to use this feature set
this parameter to \code{TRUE}. NOTE: requests will fail if this parameter is
set to \code{TRUE} and your plan does not have authority to access security
information.}

\item{language}{Defaults to \code{en} (English). But can be \href{https://ipstack.com/documentation#language}{any, valid 2-letter language spec supported by the API}.}

\item{ssl}{if your plan supports making calls via \code{https} vs plaintet \code{http} set
this to \code{TRUE}}

\item{ipstack_api_key}{if not placed in the \code{IPSTACK_API_KEY} environment
variable, place it here. Otherwise, API requests fail}
}
\value{
\code{list}
}
\description{
Perform "standard" IP lookup
}
\examples{
\dontrun{
ip_lookup("155.52.187.7")
}
}
\references{
\url{https://ipstack.com/documentation}
}
