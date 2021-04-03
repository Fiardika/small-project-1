!/bin/bash

jawaban="Y"

read -p "Akan dilakukan konfigurasi automasi untuk web server dan database. Lanjutkan? (Y/n) " pilih;

if [ $pilih == $jawaban ];
then
 echo "Membuat Direktori VirtualHost..."
 sudo mkdir -p /var/www/landing-page.com/public_html
 sudo mkdir -p /var/www/fiar-wordpress.com/public_html
 sudo mkdir -p /var/www/sosial-media.com/public_html
 echo "Pembuatan Direktori Selesai!"
 echo "========================="
 echo ""
 echo "Mengubah Ownership Direktori VirtualHost..."
 sudo chown -R vagrant:vagrant /var/www/landing-page.com/public_html
 sudo chown -R vagrant:vagrant /var/www/fiar-wordpress.com/public_html
 sudo chown -R vagrant:vagrant /var/www/sosial-media.com/public_html
 echo "Mengubah Ownership Selesai!"
 echo "========================="
 echo ""
 echo "Mengubah Permission Folder /var/www/"
 sudo chmod -R 755 /var/www
 echo "Mengubah Permission Selesai!"
 echo "========================"
 echo ""
 echo "Clone Source Code landing-page..."
 git clone https://github.com/Fiardika/landing-page.git
 mv landing-page/* /var/www/landing-page.com/public_html/
 rm -rf landing-page
 echo "========================"
 echo ""
 echo "Clone Source Code WordPress..."
 git clone https://github.com/Fiardika/WordPress.git
 mv WordPress/* /var/www/fiar-wordpress.com/public_html/
 rm -rf WordPress
 echo "========================"
 echo ""
 echo "Clone Source Code sosial-media..."
 git clone https://github.com/Fiardika/sosial-media.git
 mv sosial-media/* /var/www/sosial-media.com/public_html/
 rm -rf sosial-media
 echo "========================"
 echo ""
 echo "Konfigurasi File Virtual Host..."
 sudo wget https://gist.githubusercontent.com/Fiardika/9bbe9d483aa338cc3b0dbd51477e99db/raw/87a9b3190d712ca5b77eee3d6747b22a04c50b32/000-default.conf -O /etc/apache2/sites-available/000-default.conf
 echo "========================"
 echo "Konfigurasi Selesai"
 exit 0
else
 echo "Setup dibatalkan"
 exit 1
fi
