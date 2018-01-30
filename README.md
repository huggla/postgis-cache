# postgis-cache
Docker image that creates a cache of foreign postgis tables. The cache consists of a database with materialized views stored in ram.

## Environment variables
### pre-set variables (can be set at runtime)
PGDATA (/tmp/pgdata): Where the cache database is stored inside the container.
USER (reader): Name of database user with read access to the cache database.
USER_PASSWORD (read): Password for USER.
DATABASE cache                      # Container database name
ENV FOREIGN_SERVER_NAME foreign_server  # Container database foreign server name
ENV FOREIGN_SERVER_PORT 5432            # Foreign server database port

# Mandatory runtime variables
# ---------------------------
# FOREIGN_SERVER_ADDRESS                # Foreign server address
# FOREIGN_SERVER_DATABASE               # Foreign server database name
# FOREIGN_SERVER_USER                   # Foreign server user name
# FOREIGN_SERVER_USER_PASSWORD          # Foreign server user password
# FOREIGN_SERVER_SCHEMAS                # Foreign server schemas to cache

# Optional runtime variables
# --------------------------
# <schema>                              # Foreign server table names (subset of <schema>)
# USER_PASSWORD_FILE                    # Container database user password file
# FOREIGN_SERVER_USER_PASSWORD_FILE     # Foreign server user password file
# ADDITIONAL_CONFIGURATION              # Container runtime bash commands 

# Additional variables: https://hub.docker.com/_/postgres/

(mount a volume if you prefer file cache).
