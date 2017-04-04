#!/bin/bash
# SabNZB installation


cat files/includes/sabnzb.docker >> docker-compose.yml

$SUDO sed -i "s@INCOMING@$INC_PATH@g" docker-compose.yml
$SUDO sed -i "s@dl-newsgroups_sabnzdb@$Sb_CNAME@g" docker-compose.yml
$SUDO sed -i "s@5002@$Sb_CPORT@g" docker-compose.yml

# Set Muximux configuration
cat <<EOF >> files/apps/muximux/conf/www/muximux/settings.ini.php

[SABnzbd]
name = "SABnzbd"
url = "http://192.168.42.52:5002"
scale = 1
icon = "muximux-arrow-down"
color = "#f5b907"
enabled = "true"
EOF

$SUDO sed -i "s@192.168.42.52@$IFACE@g" files/apps/muximux/conf/www/muximux/settings.ini.php
$SUDO sed -i "s@5002@$Sb_CPORT@g" files/apps/muximux/conf/www/muximux/settings.ini.php

INSTALLED+=('Sb')
