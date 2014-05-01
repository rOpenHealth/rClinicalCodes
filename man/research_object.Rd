\name{research_object}
\alias{research_object}
\title{Downloads Research objects for articles from www.clinicalcodes.org}
\usage{
research_object(article_ids, download_codes = FALSE, trim = 50)
}
\arguments{
  \item{article_ids}{integer representiong the id of a
  www.ClinicalCodes.org article}

  \item{download_codes}{logical should the individual code
  lists be downloaded as part of the research object?}

  \item{trim}{integer How many characters from titles
  should be included in list names for multiple codelists?}
}
\value{
an object of class ResearchObject (R representation of a
ClinicalCodes research object)
}
\description{
This function builds an R representation of a ClinicalCodes
Research object
}
\details{
The ResearchObject contains metadata describing the article
(URI, abstract, ID, title, authors, doi, journal etc.),
comments on the article, codelist metadata (associated
articles, name, url, number of codes in the list, user
field names, comments) and optional full codelists. The
individual codelists can be downloaded directly with the
download_codes argument set to TRUE. Otherwise they can be
associated later using the codelists_for_ro() function
}
\examples{
\dontrun{
# get research object and codes
RO <- research_object(article_ids = 2, download_codes = FALSE)
ROs  <- research_object(article_ids = 5:7, download_codes = FALSE)
}
}

