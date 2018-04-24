FROM huggla/postgres-cache:20180424 AS postgres-cache
FROM huggla/postgis-alpine:20180424

USER root

COPY --from=postgres-cache "$CONFIG_DIR/initdb" "$CONFIG_DIR/initdb"

USER sudoer

# pre-set variables (can be set at runtime)
# ------------------------------------------
ENV REV_USER="reader" \
    REV_USER_PASSWORD="read" \
    REV_DATABASE="cache" \
    REV_TEMPLATE="template_postgis" \
    REV_FOREIGN_SERVER_NAME="foreign_server" \
    REV_FOREIGN_SERVER_PORT="5432" \
    REV_param_fsync="off" \
    REV_param_full_page_writes="off"
# ------------------------------------------
