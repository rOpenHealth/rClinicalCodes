\name{codelists_for_ro}
\alias{codelists_for_ro}
\title{Associates lists of clinical codes with a ClinicalCodes research object}
\usage{
codelists_for_ro(ro)
}
\arguments{
  \item{ro}{an object of class ResearchObject}
}
\value{
a new ResearchObject with associated clinicalcodes
dataframes for all codelists
}
\description{
This function uses the codelist_url slot in a Research
object to download codelists
}
\details{
Internally it calls the get_clinicalcodes() function with a
url argument
}
\examples{
\dontrun{
# get research object without codes
RO <- research_object(article_id = 2, download_codes = FALSE)
# associate codes
RO <- codelists_for_ro(RO)
}
}

