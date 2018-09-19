#!/bin/bash

USER="ariss"

if [[ $EUID -ne 0 ]]; then
   echo -e 'This script must be run as root!'
   exit 1
elif [ -z "$1" ] ; then
   echo -e 'Please input hostname!'
   exit 1
elif [ -z "$2" ] ; then
   echo -e 'Please specify the path!'
   exit 1
fi

mkdir -p $2/$1/public
chown -R $USER:$USER $2/$1
chmod -R 755 $2/$1
hostess add $1 127.0.0.1

# Fix for Chromium: run as user
if [ ! -d "/home/$USER/.pki/nssdb" ] ; then
    mkdir -p /home/$USER/.pki/nssdb
    certutil -N --empty-password -d /home/$USER/.pki/nssdb
    certutil -d sql:/home/$USER/.pki/nssdb -A -t "C,," -n 'SukabumiToday Root CA' -i /etc/pki/ca-trust/source/anchors/stCA.crt
fi

if [ ! -f "/etc/nginx/certs/$1.key" ] ; then
    openssl genrsa -out /etc/nginx/certs/$1.key 2048
    openssl req -new -key /etc/nginx/certs/$1.key -out /etc/nginx/certs/$1.csr \
     -subj "/CN=$1/emailAddress=admin@$1" -config /etc/pki/tls/openssl.cnf

    openssl x509 -days 365 -sha256 -req -CAcreateserial \
      -CA /etc/ssl/certs/stCA.crt -CAkey /etc/ssl/certs/stCA.key \
      -in /etc/nginx/certs/$1.csr -out /etc/nginx/certs/$1.crt

    certutil -d sql:/home/$USER/.pki/nssdb -A -t "P,," -n $1 -i /etc/nginx/certs/$1.crt
fi

chown -R $USER:$USER /home/$USER/.pki/nssdb
chown -R $USER:$USER /etc/nginx/certs/

cat > /etc/nginx/conf.d/$1.conf <<EOF
server {
    listen 80; listen 443 ssl http2;
    server_name $1;
    root $2/public;
    ssl_certificate /etc/nginx/certs/$1.crt;
    ssl_certificate_key /etc/nginx/certs/$1.key;
    include /etc/nginx/default.d/*.conf;
    location / {
        try_files \$uri \$uri/ /index.php\$args;
    }
}
EOF

systemctl reload nginx
