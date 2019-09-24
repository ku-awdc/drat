# To add a package:

library('drat')
dir <- '~/Documents/GitHub/drat'

# R CMD build TestRcpp
# R CMD install --build TestRcpp_0.1-1.tar.gz
# And win-builder
# Then put them in incoming

setwd(file.path(dir,"incoming"))

for(p in list.files()){
	cat('Inserting', p, '\n')
	insertPackage(p, dir)
	file.remove(p)
}
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
