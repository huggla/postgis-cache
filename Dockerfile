FROM huggla/postgis-alpine AS postgis-alpine
FROM huggla/postgres-cache

USER root

COPY --from=postgis-alpine "$CONFIG_DIR/initdb" "$CONFIG_DIR/initdb"

USER sudoer
