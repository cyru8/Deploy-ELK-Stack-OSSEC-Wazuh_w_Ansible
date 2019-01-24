
#log to journal showing script start
systemd-cat -p "notice" -t wp_mariadb_config printf "%s" "wp_mariadb_config.sh start" 

#execute wp_mariadb_config.sql statements as the root mysql user, 
mysql -u root -p password -e /usr/share/nginx/html/wp_mariadb_config.sql

#remember password for root hasn't been set yet

#Disable the wp_mariadb_config.service
services --disabled=wp_mariadb_config.service

#log to journal showing script end
systemd-cat -p "notice" -t wp_mariadb_config printf "%s" "wp_mariadb_config.sh end" 

#Remove Symbolic Link
rm -f /etc/systemd/system/multi-user.target.wants/wp_mariadb_config.service 
