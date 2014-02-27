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



