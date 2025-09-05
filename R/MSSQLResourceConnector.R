#' MS SQL DBI resource connector
#'
#' Makes a ODBC DBI connection to a MS SQL server from a resource description.
#'
#' @docType class
#' @format A R6 object of class MSSQLResourceConnector
#' @import R6
#' @import httr
#' @export
MSSQLResourceConnector <- R6::R6Class(
  "MSSQLResourceConnector",
  inherit = ODBCResourceConnector,
  public = list(

    #' @description Creates a new MSSQLResourceConnector instance.
    #' @return A MSSQLResourceConnector object.
    initialize = function() {},

    #' @description Check that the provided resource has a URL that locates a MS SQL object: the URL scheme must be "odbc+mssql".
    #' @param resource The resource object to validate.
    #' @return A logical.
    isFor = function(resource) {
      super$isFor(resource) && endsWith(super$parseURL(resource)$scheme, "+mssql")
    },

    #' @description Get the MS SQL ODBC driver connection string.
    #' @param resource A valid resource object.
    #' @return The MS SQL ODBC driver connection parameters list.
    getConnectionParameters = function(resource) {
      url <- super$parseURL(resource)
      driver <- "ODBC Driver 18 for SQL Server"
      database <- super$getDatabaseName(url)
      if (is.null(resource$secret) || nchar(resource$secret) == 0) {
        list(
          Driver = driver,
          Server = paste0(url$host, ",", url$port),
          Database = database,
          Trusted_Connection = "yes",
          TrustServerCertificate = "yes"
        )
      } else {
        list(
          Driver = driver,
          Server = paste0(url$host, ",", url$port),
          Database = database,
          UID = resource$identity,
          PWD = resource$secret,
          TrustServerCertificate = "yes"
        )
      }
    }
  )
)
