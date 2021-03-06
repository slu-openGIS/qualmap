## Release summary
This is the first resubmission of an update to the previous CRAN release. Based on an email this morning from Uwe, a link in the package level help file has been removed that was causing a NOTE. The NOTE no longer appears on winbuilder.

It contains modifications that make it compatible with the upcoming release of `dplyr` v1.0 as well as several bug fixes. It also adds new functionality to several key functions and a new function, `qm_verify()`.

## Test environments
* local OS X install: R 4.0.0
* Linux xenial distribution (on Travis CI): R-release, R-oldrel, R-devel, R-3.5.3, and R-3.4.4
* macOS (on Travis CI): R-release, R-oldrel, R-3.5.3, and R-3.4.4
* windows x64 (on Appveyor): R-release, R-patched, R-oldrel, R-3.5.3, and R-3.4.4
* windows i386 (on Appveyor): R-patched
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local or CI checks except: 

* R-3.5.3 on macOS (via Travis), which is having an issue installing the `DT` package. Other checks of R-3.5.3 install `DT` without issue on Linux and Windows.
* R-3.4.4 on Linux and macOS (via Travis), which are trying and failing to install the suggested package, `rgdal`, of a depdency for this package, `sf`

## Reverse dependencies
Not applicable.
