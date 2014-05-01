rClinicalCodes
==============

David A. Springate 2014

R tools for integrating with the [ClinicalCodes](www.clinicalcodes.org) web repository
---------------------------------------------------------------------------------------

This package provides an R interface for downloading clinical code lists and research objects from the repository

You can install the package from CRAN (Submitted but not yety accepted!):
```
install.packages("rClinicalCodes")
library(rClinicalCodes)
```

You can install the development version from github using the devtools package:

```R
install.packages("devtools")
require(devtools)
install_github("rClinicalCodes", "rOpenHealth")
require(rClinicalCodes)
```
The master branch will always be checked with devtools::check

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

Getting lists of all articles
-----------------------------

```R
all_articles <- all_ClinicalCodes_articles()
all_articles[1,]
##                 Type                  Title Journal Year Authors                                                        link ID
## 1 QOF Business Rules QOF Business Rules v24      NA 2012      NA https://clinicalcodes.rss.mhs.man.ac.uk/medcodes/article/1/  1
```

Research objects
----------------

The ClinicalCodes repository supplies article and codelist metadata in the form of a JSON research object. Research objects contain metadata describing the article (URI, abstract, ID, title, authors, doi, journal etc.), comments on the article, codelist metadata (associated articles, name, url, number of codes in the list, user field names, comments) and optional full codelists.

rClinicalCodes provides functions to access these and to import them as R objects:

### Import the research object for a single article

```R
RO <- research_object(article_ids = 5, download_codes = TRUE)
```
### Import for a number of articles

```R
ROs  <- research_object(article_ids = all_articles$ID[1:3], download_codes = TRUE)
sapply(ROs, names)
##       1: QOF Business Rules v24 2: QOF Business Rules v5 5: Withdrawing Performance Indicators: Retrospective 
##  [1,] "URI"                     "URI"                    "URI"                                                
##  [2,] "abstract"                "abstract"               "abstract"                                           
##  [3,] "article_ID"              "article_ID"             "article_ID"                                         
##  [4,] "article_title"           "article_title"          "article_title"                                      
##  [5,] "article_type"            "article_type"           "article_type"                                       
##  [6,] "authors"                 "authors"                "authors"                                            
##  [7,] "codelists"               "codelists"              "codelists"                                          
##  [8,] "comments"                "comments"               "comments"                                           
##  [9,] "correspondence_author"   "correspondence_author"  "correspondence_author"                              
## [10,] "correspondence_email"    "correspondence_email"   "correspondence_email"                               
## [11,] "date_accessed"           "date_accessed"          "date_accessed"                                      
## [12,] "doi"                     "doi"                    "doi"                                                
## [13,] "fulltext"                "fulltext"               "fulltext"                                           
## [14,] "journal"                 "journal"                "journal"                                            
## [15,] "link"                    "link"                   "link"                                               
## [16,] "publication_year"        "publication_year"       "publication_year"                                   
## [17,] "uploading_user"          "uploading_user"         "uploading_user"       
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



