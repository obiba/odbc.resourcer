# MS SQL Server Usqage Example

This directory contains an example of how to use the `odbc.resourcer` package to connect to a Microsoft SQL Server database and retrieve table values.

## Prerequisites

- An instance of Microsoft SQL Server running and accessible.

```
# get the docker image
make pull
# stqrt the container
make up
```

- Some initial data in the database. You can use the provided `init-scripts/init.sql` script to create a sample database and table.

```
# initialize the database with sample data
make init
```

- The `odbc.resourcer` R package installed.

```
remote::install_github("obiba/odbc.resourcer")
```

## Usage

See provided `mssql-client.R` script for an example of how to connect to the database and retrieve data.
