#!/bin/sh

cp -f /var/spool/cron/crontabs/root /var/spool/cron/crontabs/root.backup
cat /var/spool/cron/crontabs/root.backup |grep -v "ghettoVCB" >/var/spool/cron/crontabs/root
echo "0 2 * * 1-5 /opt/ghettoVCB/daily_backup.sh >/dev/null 2>&1" >>/var/spool/cron/crontabs/root
echo "0 4 * * 6 /opt/ghettoVCB/weekly_backup.sh >/dev/null 2>&1" >>/var/spool/cron/crontabs/root
kill $(cat /var/run/crond.pid) 2>/dev/null
crond
