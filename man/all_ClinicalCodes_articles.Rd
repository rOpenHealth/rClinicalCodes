\name{all_ClinicalCodes_articles}
\alias{all_ClinicalCodes_articles}
\title{Downloads a list of all articles in ClinicalCodes}
\usage{
all_ClinicalCodes_articles()
}
\value{
A dataframe of article information, links and IDs
}
\description{
This function gives a dataframe of all articles listed in
the ClinicalCodes repository.
}
\details{
Article IDs from the list are included and can then be
passed to the download functions to import codelists and
research objects into R
}
\examples{
\dontrun{
all_articles <- all_ClinicalCodes_articles()
}
}

