#!/bin/sh -e

# Initialize ownCloud database

test "$OWNCLOUD_DB_NAME"
test "$OWNCLOUD_DB_USER"
test "$OWNCLOUD_DB_PASSWORD"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
CREATE USER $OWNCLOUD_DB_USER PASSWORD '$OWNCLOUD_DB_PASSWORD';
CREATE DATABASE $OWNCLOUD_DB_NAME;
GRANT ALL PRIVILEGES ON DATABASE $OWNCLOUD_DB_NAME TO $OWNCLOUD_DB_USER;
EOSQL
