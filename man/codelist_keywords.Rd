\name{codelist_keywords}
\alias{codelist_keywords}
\title{Extract keywords from clinical code lists}
\usage{
codelist_keywords(codelist, keyword_column = "description",
  extra_stopwords = NULL)
}
\arguments{
  \item{codelist}{a dataframe of clinical codes, such as
  downloaded using the get_ClinicalCodes function}

  \item{keyword_column}{The column of the dataframe to
  extract keywords from}

  \item{extra_stopwords}{an optional character vector of
  further stopwords to remove}
}
\value{
character vector of keywords, sorted by frequency in the
list
}
\description{
This function takes a dataframe of clinical codes and gives
a vector of keywords, sorted by frequency
}
\details{
All terms are converted to lower case. Common stopwords,
whitespace and punctuation are removed Optional
extra_stopwords vector
}
\examples{
\dontrun{
# Get codelist from url:
angina_codes <- get_ClinicalCodes(
url = "https://clinicalcodes.rss.mhs.man.ac.uk/medcodes/article/6/codelist/angina/download/")
codelist_keywords(angina_codes, extra_stopwords = c("good", "poor", "[x]"))
}
}

