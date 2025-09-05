# Example of connecting to a Microsoft SQL Server database using the odbc.resourcer package
# Run the Makefile to start the SQL Server container before executing this script:
# make up
# Insert some test data into the database after the SQL Server container is running:
# make init
library(odbc.resourcer)

# Create a resource
res <- resourcer::newResource(url = "odbc+mssql://localhost:1433/EpidemiologyDB/PatientData", identity = "sa", secret = "YourStrong@Password123")
# Create a resource client
client <- resourcer::newResourceClient(res)
# Coerce resource to a data frame
df <- client$asDataFrame()
df
# Disconnect the client
client$close()


# Troubleshooting with direct connection using odbc and DBI packages
library(odbc)
library(DBI)

# Connect using odbc package
conn <- DBI::dbConnect(odbc::odbc(),
                  Driver = "ODBC Driver 18 for SQL Server",
                  Server = "localhost,1433",
                  Database = "EpidemiologyDB",
                  UID = "sa",  # Use 'sa' instead of 'myuser'
                  PWD = "YourStrong@Password123",  # Use the SA password from docker-compose
                  TrustServerCertificate = "yes")

# Test the connection
DBI::dbGetQuery(conn, "SELECT TOP 5 * FROM PatientData")
# Disconnect
DBI::dbDisconnect(conn)
