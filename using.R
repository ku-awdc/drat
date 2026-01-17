# To add a package:

library('drat')
dir <- '~/Documents/GitHub/drat'

## Make sure repo is set up:
# First go to https://ku-awdc.r-universe.dev/apis and download a snapshot of macos, windows, source (all R versions) for a single pakacge e.g. koalas
file.copy("~/Downloads/ku-awdc-snapshot/bin", dir, recursive=TRUE)
pp <- list.files("~/Downloads/ku-awdc-snapshot/src/contrib", pattern=".tar.gz", full=TRUE)
stopifnot(length(pp)==1)
insertPackage(pp, dir)

# R CMD build TestRcpp
# R CMD install --build TestRcpp_0.1-1.tar.gz
# And win-builder
# Then put them in incoming

setwd(file.path(dir,"incoming"))

ff <- list.files()
ff <- ff[ff!='README.md']
for(p in ff){
	cat('Inserting', p, '\n')
	insertPackage(p, dir)
	file.remove(p)
}
pruneRepo(dir, remove=TRUE)

# Then push

# Then:
library('drat')
addRepo('ku-awdc')
getOption("repos")
install.packages('TestRcpp')


# Or without even having drat installed:
install.packages('TestRcpp', repos=c(CRAN="https://cran.rstudio.com/", "ku-awdc"="https://ku-awdc.github.io/drat/"))
# (order of repos is irrelevant)

# If suggests are needed:
install.packages('TestRcpp', dependencies=TRUE, repos=c(CRAN="https://cran.rstudio.com/", "ku-awdc"="https://ku-awdc.github.io/drat/"))
