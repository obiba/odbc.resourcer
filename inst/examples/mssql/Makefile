# Makefile for managing the Docker container for SQL Server

pull:
	docker compose pull

up:
	docker compose up

stop:
	docker compose stop

down:
	docker compose down

databases:
	docker exec -it mssql /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'YourStrong@Password123' -C -Q "SELECT name FROM sys.databases"

init:
	docker exec -i mssql /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'YourStrong@Password123' -C -i /scripts/init.sql

ubuntu-deps:
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
	curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
	apt-get update
	ACCEPT_EULA=Y apt-get install -y msodbcsql18
	apt-get install unixodbc-dev
