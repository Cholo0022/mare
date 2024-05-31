FROM mysql:latest

LABEL version="1.0"
LABEL descripción="Imagen de Mysql"

ENV MYSQL_ROOT_PASSWORD 123Queso.
ENV MYSQL_DATABASE mare

ADD mare.sql /docker-entrypoint-initdb.d 

EXPOSE 3306
