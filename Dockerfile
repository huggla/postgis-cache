FROM mdillon/postgis:10-alpine

COPY ./docker-entrypoint-initdb.d/x01.cache.sh /docker-entrypoint-initdb.d/x01.cache.sh

RUN mkdir -m 777 /tmp/pgdata \
 && chmod ugo+x /docker-entrypoint-initdb.d/x01.cache.sh
 
ENV PGDATA /tmp/pgdata
ENV USER reader
ENV USER_PASSWORD read
ENV DATABASE cache
ENV SCHEMA foreign_data
ENV FOREIGN_SERVER_NAME foreign_server
ENV FOREIGN_SERVER_PORT 5432
