# MS SQL Server Usage Example

This directory contains an example of how to use the `odbc.resourcer` package to connect to a Microsoft SQL Server database and retrieve table values.

## Prerequisites

- Run an instance of Microsoft SQL Server.

```
# get the docker image
make pull
# start the container
make up
```

- Add some initial data in the database. You can use the provided `init-scripts/init.sql` script to create a sample database and table.

```
# initialize the database with sample data
make init
# list databases
make databases
```

- Install the `odbc.resourcer` R package.

```
remote::install_github("obiba/odbc.resourcer")
```

- You may need to install some system dependencies:

```
sudo make ubuntu-deps
```

## Usage

See provided `mssql-client.R` script for an example of how to connect to the database and retrieve data.
