% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repo.R
\name{repo_status}
\alias{repo_status}
\alias{repo_ping}
\title{Show the status of CRAN-like repositories}
\usage{
repo_status(
  platforms = NULL,
  r_version = getRversion(),
  bioc = TRUE,
  cran_mirror = NULL
)

repo_ping(
  platforms = NULL,
  r_version = getRversion(),
  bioc = TRUE,
  cran_mirror = NULL
)
}
\arguments{
\item{platforms}{Platforms to use, default is the current platform,
plus source packages.}

\item{r_version}{R version(s) to use, the default is the current
R version, via \code{\link[=getRversion]{getRversion()}}.}

\item{bioc}{Whether to add the Bioconductor repositories. If you
already configured them via \code{options(repos)}, then you can
set this to \code{FALSE}.}

\item{cran_mirror}{The CRAN mirror to use.}
}
\value{
A tibble that has a row for every repository, on every
queried platform and R version. It has these columns:
\itemize{
\item \code{name}: the name of the repository. This comes from the names
of the configured repositories in \code{options("repos")}, or
added by pkgcache. It is typically \code{CRAN} for CRAN, and the
current Bioconductor repositories are \code{BioCsoft}, \code{BioCann},
\code{BioCexp}, \code{BioCworkflows}.
\item \code{url}: base URL of the repository.
\item \code{bioc_version}: Bioconductor version, or \code{NA} for
non-Bioconductor repositories.
\item \code{platform}: platform, possible values are \code{source}, \code{macos} and
\code{windows} currently.
\item \code{path}: the path to the packages within the base URL, for a
given platform and R version.
\item \code{r_version}: R version, one of the specified R versions.
\item \code{ok}: Logical flag, whether the repository contains a metadata
file for the given platform and R version.
\item \code{ping}: HTTP response time of the repository in seconds. If
the \code{ok} column is \code{FALSE}, then this columns in \code{NA}.
\item \code{error}: the error object if the HTTP query failed for this
repository, platform and R version.
}
}
\description{
It checks the status of the configured or supplied repositories.
}
\details{
\code{repo_ping()} is similar to \code{repo_status()} but also prints a short
summary of the data, and it returns its result invisibly.
}
\examples{
\dontshow{if (FALSE) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
repo_status()
repo_status(
  platforms = c("windows", "macos"),
  r_version = c("4.0", "4.1")
)
repo_ping()
\dontshow{\}) # examplesIf}
}
\seealso{
Other repository functions: 
\code{\link{repo_add}()},
\code{\link{repo_get}()}
}
\concept{repository functions}
