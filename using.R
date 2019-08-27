# To add a package:

library('drat')
dir <- '~/Documents/GitHub/drat'

# R CMD build TestRcpp
# R CMD install --build TestRcpp_0.1-1.tar.gz
# And win-builder
insertPackage('TestRcpp_0.1-1.tar.gz', dir)
insertPackage('TestRcpp_0.1-1.tgz', dir)
# Then push

# Then:
library('drat')
addRepo('ku-awdc')
getOption("repos")
install.packages('TestRcpp')


# Or without even having drat installed:
install.packages('TestRcpp', repos=c(CRAN="https://cran.rstudio.com/", "ku-awdc"="https://ku-awdc.github.io/drat/"))
