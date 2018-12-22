
# ipstack

Tools to Query ‘IP’ Address Information from the ‘ipstack’ ‘API’

## Description

The ‘ipstack’ service (<https://ipstack.com/>) offers a powerful,
real-time ‘IP’ to geolocation ‘API’ capable of looking up accurate
location data and assessing security threats originating from risky ‘IP’
addresses. Tools are provided to query the simple and bulk ‘API’ query
endpoints.

## What’s Inside The Tin

The following functions are implemented:

  - `bulk_lookup`: Perform “bulk” IP lookup
  - `ip_lookup`: Perform “standard” IP lookup

## Installation

``` r
devtools::install_github("hrbrmstr/ipstack")
```

## Usage

``` r
library(ipstack)

# current verison
packageVersion("ipstack")
```

    ## [1] '0.1.0'

``` r
str(ip_lookup("155.52.187.7"), 2)
```

    ## List of 13
    ##  $ ip            : chr "155.52.187.7"
    ##  $ type          : chr "ipv4"
    ##  $ continent_code: chr "NA"
    ##  $ continent_name: chr "North America"
    ##  $ country_code  : chr "US"
    ##  $ country_name  : chr "United States"
    ##  $ region_code   : chr "MA"
    ##  $ region_name   : chr "Massachusetts"
    ##  $ city          : chr "Boston"
    ##  $ zip           : chr "02115"
    ##  $ latitude      : num 42.3
    ##  $ longitude     : num -71.1
    ##  $ location      :List of 8
    ##   ..$ geoname_id                : int 4930956
    ##   ..$ capital                   : chr "Washington D.C."
    ##   ..$ languages                 :'data.frame':   1 obs. of  3 variables:
    ##   ..$ country_flag              : chr "http://assets.ipstack.com/flags/us.svg"
    ##   ..$ country_flag_emoji        : chr "\U0001f1fa\U0001f1f8"
    ##   ..$ country_flag_emoji_unicode: chr "U+1F1FA U+1F1F8"
    ##   ..$ calling_code              : chr "1"
    ##   ..$ is_eu                     : logi FALSE
