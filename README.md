# postgis-cache
Docker image that creates a cache of foreign Postgis tables. 
The cache consists of a database with materialized views stored in ram.

## Environment variables
### pre-set variables (can be set at runtime)
* PGDATA (/tmp/pgdata): Where the cache database is stored inside the container.
* USER (reader): Name of database user with read access to the cache database.
* USER_PASSWORD (read): Password for USER.
* DATABASE (cache): Name of the container Postgis database.
* FOREIGN_SERVER_NAME (foreign_server): Name of the foreign server in the cache database.
* ENV FOREIGN_SERVER_PORT (5432): The database port on the source database.

### Mandatory runtime variables
FOREIGN_SERVER_ADDRESS: Network address to the source Postgis server.
FOREIGN_SERVER_DATABASE: Name of database containing tables to be cached.
FOREIGN_SERVER_USER: Database user, with read permission, on the source database.
FOREIGN_SERVER_USER_PASSWORD: Password for FOREIGN_SERVER_USER.
FOREIGN_SERVER_SCHEMAS: Comma-separated list of source schemas that contains tables to cache.

### Optional runtime variables
\<schema\>: Comma-separated sub-set of tables in \<schema\> to cache.
USER_PASSWORD_FILE: File containing the password for USER.
FOREIGN_SERVER_USER_PASSWORD_FILE: File containing the password for FOREIGN_SERVER_USER.
ADDITIONAL_CONFIGURATION: Semi colon-separated list of bash commands to run during database init.

### Additional variables
Check out the postgres base image documentation, https://hub.docker.com/_/postgres/.

(mount a volume if you prefer file cache).
