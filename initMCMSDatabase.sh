#!/bin/bash
echo "SELECT 'CREATE DATABASE mcmsdb' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mcmsdb')\gexec" | psql
psql -tf /sql/initMCMSDatabase.sql -v vPassword="'mcmsuser123!'" -v vUsername="'mcmsuser'"
echo "GRANT ALL PRIVILEGES ON DATABASE mcmsdb TO mcmsuser" | psql
echo "\c mcmsdb"
