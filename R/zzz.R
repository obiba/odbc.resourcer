# register known file getters, DBI connectors and resolvers
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Registering MSSQLResourceConnector...")
  resourcer::registerDBIResourceConnector(MSSQLResourceConnector$new())
}

# unregister all resolvers
.onDetach <- function(libpath) {
  resourcer::unregisterDBIResourceConnector("MSSQLResourceConnector")
}
