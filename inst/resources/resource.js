var odbc_resourcer = {
  settings: {
    "title": "ODBC Resources",
    "description": "Access to databases implementing the ODBC interface.",
    "web": "https://github.com/obiba/odbc.resourcer",
    "categories": [
      {
        "name": "database",
        "title": "Database",
        "description": "Data are stored in a database."
      }
    ],
    "types": [
      {
        "name": "mssql",
        "title": "MS SQL Server",
        "description": "The [MS SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-2022) resource is accessible through a ODBC driver (experimental).",
        "tags": ["database"],
        "parameters": {
          "$schema": "http://json-schema.org/schema#",
          "type": "array",
          "items": [
            {
              "key": "host",
              "type": "string",
              "title": "Host",
              "description": "Remote host name or IP address of the database server."
            },
            {
              "key": "port",
              "type": "integer",
              "title": "Port",
              "description": "Database port number.",
              "default": 1433
            },
            {
              "key": "database",
              "type": "string",
              "title": "Database",
              "description": "The database name."
            },
            {
              "key": "table",
              "type": "string",
              "title": "Table",
              "description": "The table name."
            }
          ],
          "required": [
            "host", "port", "database", "table"
          ]
        },
        "credentials": {
          "$schema": "http://json-schema.org/schema#",
          "type": "array",
          "description": "Credentials are optional. If ommitted, trusted connection is expected.",
          "items": [
            {
              "key": "username",
              "type": "string",
              "title": "User name",
              "description": "Valid database user name."
            },
            {
              "key": "password",
              "type": "string",
              "title": "Password",
              "format": "password",
              "description": "The user's password."
            }
          ]
        }
      }
    ]
  },
  asResource: function(type, name, params, credentials) {
    var toODBCResource = function(driver, host, port, table, credentials) {
      return {
          name: name,
          url: "odbc+" + driver + "://" + host + ":" + port + "/" + table,
          identity: credentials.username,
          secret: credentials.password
      }
    };

    //
    // Resource factory functions by resource form type
    //
    var toResourceFactories = {
      "mssql": function(name, params, credentials) {
          return toODBCResource("mssql", params.host, params.port, encodeURI(params.database) + "/" + encodeURI(params.table), credentials);
      }
    };

    // Check if there is a resource factory function for the requested resource form type
    if (toResourceFactories[type]) {
        return toResourceFactories[type](name, params, credentials);
    }
    return undefined;
  }
}
