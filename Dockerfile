FROM huggla/postgis-alpine AS postgis-alpine
FROM huggla/postgres-cache

USER root

COPY --from=postgis-alpine "$CONFIG_DIR/initdb" "$CONFIG_DIR/initdb"

RUN /bin/chown -R root:$BEV_NAME "$CONFIG_DIR/initdb" \
 && /bin/chmod -R u=rwX,g=rX,o= "$CONFIG_DIR/initdb"

USER sudoer
