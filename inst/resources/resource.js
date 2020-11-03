var odbc_resourcer = {
  settings: {
    "title": "ODBC Resources",
    "description": "Access to databases implementing the ODBC interface.",
    "web": "https://github.com/obiba/odbc.resourcer",
    "categories": [],
    "types": [
      {
        "name": "dremio",
        "title": "Dremio Connector",
        "description": "The [Dremio](https://www.dremio.com/) resource is accessible through a ODBC driver (experimental).",
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
              "description": "Database port number."
            },
            {
              "key": "dataset",
              "type": "string",
              "title": "Dataset",
              "description": "The dataset path."
            }
          ],
          "required": [
            "driver", "host", "port", "dataset"
          ]
        },
        "credentials": {
          "$schema": "http://json-schema.org/schema#",
          "type": "array",
          "description": "Credentials are optional.",
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
      "dremio": function(name, params, credentials) {
          return toODBCResource("dremio", params.host, params.port, encodeURI(params.dataset), credentials);
      }
    };

    // Check if there is a resource factory function for the requested resource form type
    if (toResourceFactories[type]) {
        return toResourceFactories[type](name, params, credentials);
    }
    return undefined;
  }
}
