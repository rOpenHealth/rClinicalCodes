rCPRD
=====

David A. Springate 2014

R tools for integrating with the [ClinicalCodes](www.clinicalcodes.org) web repository
---------------------------------------------------------------------------------------

This in-development package provides an R API for downloading clinical code lists from the repository


The package is not yet on CRAN but you can install from github using the devtools package:

```R
install.packages("devtools")
require(devtools)
install_github("rClinicalCodes", "rOpenHealth")
require(rClinicalCodes)
```
The master branch will always be checked with devtools

Usage
-----

### Downloading codes by URL

```R
angina_codes <- get_ClinicalCodes(url = "https://clinicalcodes.rss.mhs.man.ac.uk/medcodes/article/6/codelist/angina/download/")

```

### Downloading codes by article id and codelist name

```R
depression_codes <- get_ClinicalCodes(article_id = 6, codelist_name = "depression")
```

### Downloading all codes for an article

```R
codelists = get_ClinicalCodes(article_id = 6)
```

Research objects
----------------

The ClinicalCodes repository supplies article and codelist metadata in the form of a JSON research object. Research objects contains metadata describing the article (URI, abstract, ID, title, authors, doi, journal etc.), comments on the article, codelist metadata (associated articles, name, url, number of codes in the list, user field names, comments) and optional full codelists.

rClinicalCodes provides functions to access these and to import them as R objects:

### Import the research object for a single article

```R
RO <- research_object(article_ids = 5, download_codes = TRUE)
```
### Import for a number of articles

```R
#' ROs  <- research_object(article_ids = 3:5, download_codes = TRUE)
```


Extracting keywords
-------------------

Once you have downloaded the codelists, you can extract the main keywords from the descriptions

```R
codelist_keywords(angina_codes, extra_stopwords = c("good", "poor"))

## [1] "angina"         "anginal"        "anginosa"       "anginosus"     
## [5] "antianginal"    "attack"         "atypical"       "cardiac"       
## [9] "cardiomyopathy" "chest"          "control"        "crescendo"     
## [13] "decubitus"      "effort"         "forms"          "hypertension"  
## [17] "improving"      "infarct"        "inversa"        "ischaemic"     
## [21] "nocturnal"      "nos"            "onset"          "pain"          
## [25] "pectoris"       "post"           "refractory"     "rest"          
## [29] "stable"         "status"         "stenocardia"    "syncope"       
## [33] "syndrome"       "therapy"        "unstable"       "worsening"  
```



