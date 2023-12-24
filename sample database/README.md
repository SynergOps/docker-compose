## Sample Database

This is a simple MariaDB database server that you can import the provided sample data using the PhpMyadmin WebUI and paly around with the data.

This is ideal for anyone that needs :
- a kickstart database for testing queries
- a database to test backup and restore automations
- a database to use as a learning workspace

## Usage

Run

```
docker compose up -d
```

Go to `http://localhost:8080` and phpMyadmin should be automatically looged in. 

__NOTE__: Do not use in public server, only for local deployment. 