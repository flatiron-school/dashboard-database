FROM postgres:14.0-alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password 
ENV POSTGRES_DB postgres 

WORKDIR /sql

COPY initMCMSDatabase.sql .
COPY initMCMSDatabase.sh /docker-entrypoint-initdb.d/
