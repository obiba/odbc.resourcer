# ODBC Resource R

[![R-CMD-check](https://github.com/obiba/odbc.resourcer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/obiba/odbc.resourcer/actions/workflows/R-CMD-check.yaml)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/odbc.resourcer)](https://cran.r-project.org/package=odbc.resourcer)

The `odbc.resourcer` package is for accessing databases implementing the ODBC API.

For a [MS SQL](https://www.microsoft.com/en-us/sql-server/sql-server-2022) server database, the resource object would be:

```r
library(odbc.resourcer)
res <- resourcer::newResource(url = "odbc+mssql://localhost:1433/database/CNSIM3", identity = "administrator", secret = "password1234")
client <- resourcer::newResourceClient(res)
client$asDataFrame()
```

The package is built on top of the [odbc](https://CRAN.R-project.org/package=odbc) package and the [DBI](https://CRAN.R-project.org/package=DBI) package.
