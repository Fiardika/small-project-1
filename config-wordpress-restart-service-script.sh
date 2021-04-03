#!/bin/bash

jawaban='Y'

read -p "Akan dilakukan konfigurasi file database untuk WordPress dan restart Service Web Server. Lanjutkan? (Y/n) " pilih;
if [ $pilih == $jawaban ];
then
 echo "Konfigurasi File Database untuk WordPress dan sosial-media"
 sudo mysql -u devopsfiar -p dbsosmed < /var/www/sosial-media.com/public_html/dump.sql
 sudo mv /var/www/fiar-wordpress.com/public_html/wp-config-sample.php /var/www/fiar-wordpress.com/public_html/wp-config.php
 sudo sed -i 's/database_name_here/dbwordpress/g' /var/www/fiar-wordpress.com/public_html/wp-config.php
 sudo sed -i 's/username_here/devopsfiar/g' /var/www/fiar-wordpress.com/public_html/wp-config.php
 sudo sed -i 's/password_here/1234567890/g' /var/www/fiar-wordpress.com/public_html/wp-config.php
 echo "Konfigurasi File Database Selesai"
 echo "========================"
 echo ""
 echo "Mengaktifkan Konfigurasi Website dan Restart Service Web Server"
 sudo a2ensite 000-default.conf
 sudo systemctl restart apache2
 echo "Konfigurasi Selesai!"
 exit 0
else
 echo "Setup dibatalkan"
 exit 1
fi

