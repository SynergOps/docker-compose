#!/bin/bash

# Online DB Backup Script for MariaDB - MySQL - PostgreSQL

# This backup script can be used to automatically backup databases
# that run in docker volume containers.
# It currently supports mariadb, mysql and PostgreSQL containers.
#
# What to change:
#   - DAYS= number of days to keep old backups. Default 3 days
#   - BACKUPDIR= absolute path to store the backups
#

# How log Databases should be retained:
DAYS=3
# Where do we do the backups 
BACKUPDIR=/home/ubuntu/backup

# Backup all mysql/mariadb inside volumes

MDB_CONTAINER=$(docker ps --format '{{.Names}}:{{.Image}}' | grep 'mysql\|mariadb' | cut -d":" -f1)

if [ ! -d $BACKUPDIR ]; then
    mkdir -p $BACKUPDIR
fi

for i in $MDB_CONTAINER; do

    MYSQL_DATABASE=$(docker exec $i env | grep MYSQL_DATABASE |cut -d"=" -f2-)
    MYSQL_PWD=$(docker exec $i env | grep MYSQL_ROOT_PASSWORD |cut -d"=" -f2-)
    
    echo "Backing up Database in: $MDB_CONTAINER"
    
    docker exec -e MYSQL_DATABASE=$MYSQL_DATABASE -e MYSQL_PWD=$MYSQL_PWD \
        $i /usr/bin/mysqldump -u root $MYSQL_DATABASE \
        | gzip > $BACKUPDIR/$i-$MYSQL_DATABASE-$(date +"%Y%m%d%H%M").sql.gz

    OLD_BACKUPS=$(ls -1 $BACKUPDIR/$i*.gz |wc -l)
    if [ $OLD_BACKUPS -gt $DAYS ]; then
        find $BACKUPDIR -name "$i*.gz" -daystart -mtime +$DAYS -delete
    fi
done

# Backup all PostgreSQL that run in docker volumes

POSTGRES_CONTAINER=$(docker ps --format '{{.Names}}:{{.Image}}' | grep 'postgres' | cut -d":" -f1)

for i in $POSTGRES_CONTAINER; do
    POSTGRES_USER=$(docker exec $i env | grep POSTGRES_USER |cut -d"=" -f2)
    
    echo "Backing up Database in: $POSTGRES_CONTAINER"
    
    docker exec -t $i pg_dumpall --exclude-database=template1 \
    -c -U $POSTGRES_USER | gzip > $BACKUPDIR/$i-$(date +"%Y%m%d%H%M").sql.gz

    OLD_POSTGRES_BACKUPS=$(ls -1 $BACKUPDIR/$i*.gz |wc -l)
    if [ $OLD_POSTGRES_BACKUPS -gt $DAYS ]; then
        	find $BACKUPDIR -name "$i*.gz" -daystart -mtime +$DAYS -delete
    fi
done

echo "$(date "+%Y-%m-%d %H:%M:%S") : Backup of Databases completed"
ls -lah $BACKUPDIR