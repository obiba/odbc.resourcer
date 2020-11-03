# ODBC Resource R

[![Build Status](https://travis-ci.com/obiba/odbc.resourcer.svg?branch=master)](https://travis-ci.com/obiba/odbc.resourcer)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/odbc.resourcer)](https://cran.r-project.org/package=odbc.resourcer)

The `odbc.resourcer` package is for accessing databases implementing the ODBC API. An example of such database is [Dremio](https://www.dremio.com/), the "next-generation data lake engine". 

For instance this is a valid resource object that can be accessed by the `DremioResourceConnector`:

```
library(odbc.resourcer)
res <- resourcer::newResource(url = "odbc+dremio://localhost:31010/\"@administrator\".CNSIM3", identity = "administrator", secret = "password1234")
client <- resourcer::newResourceClient(res)
client$asDataFrame()
```
