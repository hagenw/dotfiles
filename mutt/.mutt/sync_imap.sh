#!/bin/bash
# Sync offineimap when you can do a DNS lookup against your mailserver.
#
# To run this as a cron job, run:
# $ crontab -e
# And add the following line to the file poping up:
# */8 * * * * ~/.mutt/sync_imap.sh

imapactive=`ps -ef | grep offlineimap | grep -v grep | wc -l`
mailsync="/usr/bin/offlineimap -u quiet -q"
username=`whoami`
# The next line works only for one host
#mailhost=`cat /home/$username/.offlineimaprc | grep remotehost | awk '{print $3}'`
mailhost="posteo.de"
online=`host $mailhost | grep "has address" | wc -l`

# kill offlineimap if active, in some rare cases it may hang
case $imapactive in
'1')
   killall offlineimap && sleep 5
;;
esac

# if you can do a DNS lookup, sync your mail
case $online in
'1')
   $mailsync
;;
esac
