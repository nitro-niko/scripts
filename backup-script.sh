#!/bin/bash
#
# Script to backup
#
# This can be extended to backup multiple directories.
# Just add another directory variable and extend the backup command.

# Variables
PKGNAME=package                     # Name of service being backed up
PKGVER=`dnf list installed | grep -i gitlab | awk '{print $2}'`
PKGDIR=/etc/service                 # Location of what you are backing up
SERVICEBACKUPS=/etc/service/backup  # Location of the backups if your service has a backup command
BACKUPDIR=/opt/backup/service       # Location of where the backup files will be located
BACKUPDATE=`date '+%Y%m%d-%H%M%S'`

# Remove older than 3 backups and wait a minute
find $BACKUPDIR -type f -ctime +2 -exec rm -f {} \;
sleep 60

# Remove existing if your service has a backup command
# rm -f $GITLABBACKUPS/*

# If your service has a backup command to it, insert here

# Backup files
tar cvjpf $BACKUPDIR/$PKGNAME-$PKGVER-data-$BACKUPDATE.tar.bz2 $PKGDIR
