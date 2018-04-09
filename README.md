**Note! I use Docker latest tag for development, which means that it isn't allways working. Date tags are stable.**

# postgis-cache
Docker image that creates a cache of foreign Postgis tables. The cache consists of a database with materialized views stored in ram. Based on huggla/postgis-alpine.

## Environment variables
### pre-set runtime variables from huggla/postgis-alpine.
* REV_LOCALE="en_US.UTF-8"
* REV_ENCODING="UTF8"
* REV_TEXT_SEARCH_CONFIG="english"
* REV_HBA="local all all trust, host all all 127.0.0.1/32 trust, host all all ::1/128 trust, host all all all md5"
* REV_CREATE_EXTENSION_PGAGENT="yes"
* REV_password_postgres=generated, random
* REV_param_data_directory="'/pgdata'"
* REV_param_hba_file="'/etc/postgres/pg_hba.conf'"
* REV_param_ident_file="'/etc/postgres/pg_ident.conf'"
* REV_param_unix_socket_directories="'/var/run/postgresql'"
* REV_param_listen_addresses="'*'"
* REV_param_timezone="'UTC'"

### pre-set runtime variables.
* REV_USER="reader": Name of database user with read access to the cache database.
* REV_USER_PASSWORD="read": Password for USER.
* REV_DATABASE="cache": Name of the container Postgis database.
* REV_FOREIGN_SERVER_NAME="foreign_server": Name of the foreign server in the cache database.
* REV_ENV FOREIGN_SERVER_PORT="5432": The database port on the source database.

### Mandatory runtime variables
* REV_FOREIGN_SERVER_ADDRESS: Network address to the source Postgis server.
* REV_FOREIGN_SERVER_DATABASE: Name of database containing tables to be cached.
* REV_FOREIGN_SERVER_USER: Database user, with read permission, on the source database.
* REV_FOREIGN_SERVER_USER_PASSWORD: Password for FOREIGN_SERVER_USER.
* REV_FOREIGN_SERVER_SCHEMAS: Comma separated list of source schemas that contains tables to cache.

### Optional runtime variables
* REV_&lt;schema&gt;: Comma separated sub-set of tables in \<schema\> to cache.
* REV_USER_PASSWORD_FILE: File containing the password for USER.
* REV_FOREIGN_SERVER_USER_PASSWORD_FILE: File containing the password for FOREIGN_SERVER_USER.
* REV_param_&lt;postgres parameter name&gt;_&lt;: Additional Postgresql parameters.

* ADDITIONAL_CONFIGURATION: Semi colon separated list of bash commands to run during database init.
### Optional runtime variables


## Capabilities
Can drop all but CHOWN, DAC_OVERRIDE, FOWNER, SETGID and SETUID.

## Tips
Works with huggla/pgagent-alpine and huggla/pgbouncer-alpine.




### Optional runtime variables
* \<schema\>: Comma separated sub-set of tables in \<schema\> to cache.
* USER_PASSWORD_FILE: File containing the password for USER.
* FOREIGN_SERVER_USER_PASSWORD_FILE: File containing the password for FOREIGN_SERVER_USER.
* ADDITIONAL_CONFIGURATION: Semi colon separated list of bash commands to run during database init.

### Additional variables
Check out the postgres base image documentation, https://hub.docker.com/_/postgres/.

## Volumes
* Mount a volume at PGDATA if you prefer caching to disk.
* Mounting an empty folder on your host to /var/lib/postgresql/data prevents creation of an unnecessary volume.

## Capabilities
### Must add
* SYS_ADMIN

### Can drop
* AUDIT_CONTROL
* AUDIT_WRITE
* BLOCK_SUSPEND
* DAC_READ_SEARCH
* IPC_LOCK
* IPC_OWNER
* KILL
* LEASE
* LINUX_IMMUTABLE
* MAC_ADMIN
* MAC_OVERRIDE
* MKNOD
* NET_ADMIN
* NET_BIND_SERVICE
* NET_BROADCAST
* NET_RAW
* SETFCAP
* SETPCAP
* SYSLOG
* SYS_BOOT
* SYS_CHROOT
* SYS_MODULE
* SYS_NICE
* SYS_PACCT
* SYS_PTRACE
* SYS_RAWIO
* SYS_RESOURCE
* SYS_TIME
* SYS_TTY_CONFIG
* WAKE_ALARM

## Tips
Example of ADDITIONAL_CONFIGURATION:
```
echo "ssl = on" >> "$PGDATA/postgresql.conf"; echo "ssl_cert_file = '/run/secrets/ssl-cert-snakeoil.pem'" >> "$PGDATA/postgresql.conf"; echo "ssl_key_file = '/run/secrets/ssl-cert-snakeoil.key'" >> "$PGDATA/postgresql.conf"; head -n -1 "$PGDATA/pg_hba.conf" > /tmp/pg_hba.conf; mv /tmp/pg_hba.conf "$PGDATA/pg_hba.conf"; echo "hostssl all reader all trust" >> "$PGDATA/pg_hba.conf"; psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -c "SET TIME ZONE 'Europe/Stockholm';"
```
