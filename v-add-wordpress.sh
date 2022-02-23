#!/bin/bash
# Adding php wrapper
user="$1"
domain="$2"
home_dir="$4"
docroot="$5"
wp_password="$6"
wp_database="$7"
wp_database_user="$8"
wp_link="http://ru.wordpress.org/latest-ru_RU.zip"
wp_path="/home/$user/web/$domain/public_html"
wp_file="$wp_path/wordpress.zip"
cd $home_dir
wget $wp_link -O $wp_file
unzip $wp_file -d $wp_path
mv $wp_path/wordpress/* $wp_path
rm $wp_file
rm -rf $wp_path/wordpress/ $wp_path/index.html
#chmod -R 777 $wp_path
chown -R $user:$user /home/$user/web
$VESTA/bin/v-add-database $user $wp_database $wp_database $wp_password
cp $wp_path/wp-config-sample.php $wp_path/wp-config.php
perl -pi -e "s/database_name_here/$user"_"$wp_database/g" $wp_path/wp-config.php
perl -pi -e "s/username_here/$wp_database_user/g" $wp_path/wp-config.php
perl -pi -e "s/password_here/$wp_password/g" $wp_path/wp-config.php
