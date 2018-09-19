#!/bin/bash

VERSION="4.8.2"
USER="www-data"
GROUP="www-data"
TARGET="/var/www/myadmin"

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

cd /var/www
curl -fsSL https://files.phpmyadmin.net/phpMyAdmin/$VERSION/phpMyAdmin-$VERSION-english.zip | bsdtar -xvf-
mv /var/www/{phpMyAdmin-$VERSION-english,myadmin}

chmod -R 755 $TARGET
find $TARGET/. -type d -exec chmod 0777 {} \;
find $TARGET/. -type f -exec chmod 0644 {} \;
chown -R $USER:$GROUP $TARGET

cat > $TARGET/config.inc.php <<EOF
<?php
\$cfg['blowfish_secret'] = '`openssl rand -hex 16`';
\$i = 0; \$i++;
\$cfg['Servers'][\$i]['auth_type']       = 'cookie';
\$cfg['Servers'][\$i]['host']            = '127.0.0.1';
\$cfg['Servers'][\$i]['connect_type']    = 'tcp';
\$cfg['Servers'][\$i]['AllowNoPassword'] = false;
\$cfg['Servers'][\$i]['hide_db']         = '^(information_schema|performance_schema|mysql|phpmyadmin|sys)\$';
\$cfg['UploadDir']                       = '';
\$cfg['SaveDir']                         = '';
\$cfg['MaxRows']                         = 100;
\$cfg['SendErrorReports']                = 'never';
\$cfg['ShowDatabasesNavigationAsTree']   = false;
EOF

echo -e "phpMyAdmin has installed"
