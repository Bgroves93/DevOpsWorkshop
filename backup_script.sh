#!/bin/sh
#backup script 
now=$(date +"%d_%H_%M")
mysqldump -uroot animal > ~/animal$now.sql
mysqldump -uroot wordpress-db > ~/wordpress_db$now.sql
aws s3 cp ~/wordpress_db$now.sql s3://webtcrotch/wordpress/wordpress_db_$now.sql --acl public-read-write
aws s3 cp ~/animal$now.sql s3://webtcrotch/angus/animal$now.sql --acl public-read-write
