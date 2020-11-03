# register known file getters, DBI connectors and resolvers
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Registering DremioResourceConnector...")
  resourcer::registerDBIResourceConnector(DremioResourceConnector$new())
}

# unregister all resolvers
.onDetach <- function(libpath) {
  resourcer::unregisterDBIResourceConnector("DremioResourceConnector")
}
