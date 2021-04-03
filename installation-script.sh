#!/bin/bash

jawaban="Y"
read -p "Akan dilakukan instalasi web server, php, dan database server. Lanjutkan? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
 echo "Menyiapkan Instalasi..."
 sudo apt-get update
 echo "======================="
 echo "Instalasi Web Server"
 sudo apt-get install apache2 -y
 echo "Instalasi Web Server Selesai!"
 echo "========================"
 echo "Instalasi PHP"
 sudo apt-get install php libapache2-mod-php php-mysql -y
 echo "Instalasi PHP Selesai!"
 echo "======================="
 echo "Instalasi Database Server"
 sudo apt-get install mysql-server -y
 echo "Instalasi Database Server Selesai!"
 echo "======================="
 exit 0
else
 echo "Instalasi dibatalkan"
 exit 1

fi
