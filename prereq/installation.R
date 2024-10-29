library(pak)
install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))

pak::pkg_install("hta-pharma/ramnog")
pak::pkg_install("hta-pharma/chef")
pak::pkg_install("hta-pharma/chefCriteria")
pak::pkg_install("hta-pharma/chefStats")
pak::pkg_install("tidyr")
pak::pkg_install("haven")
