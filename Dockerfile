FROM huggla/postgis-alpine AS postgis-alpine
FROM huggla/postgres-cache

USER root

COPY --from=postgis-alpine ./initdb "$CONFIG_DIR/initdb"

USER sudoer
