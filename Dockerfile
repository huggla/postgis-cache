FROM mdillon/postgis:10-alpine

RUN mkdir -m 700 /tmp/pgdata \
 && chown postgres:postgres /tmp/pgdata
 
ENV PGDATA /tmp/pgdata
