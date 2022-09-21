#!/bin/bash

DOMINIO=$1
PASTA=$2

echo -e "<VirtualHost *:80>
	ServerName $DOMINIO
	ServerAlias www.$DOMINIO $DOMINIO
	ServerAdmin webmaster@$DOMINIO
	DocumentRoot $PASTA

	ErrorLog \${APACHE_LOG_DIR}/ofertasterenos.error.log
	CustomLog \${APACHE_LOG_DIR}/ofertasterenos.access.log combined
</VirtualHost>" > /etc/apache2/sites-available/${DOMINIO}.conf

a2ensite $DOMINIO
sed -i "1s/^/127.0.0.1      ${DOMINIO}\n /" /etc/hosts
systemctl restart apache2.service
