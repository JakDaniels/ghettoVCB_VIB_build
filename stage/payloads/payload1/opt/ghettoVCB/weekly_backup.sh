#!/bin/sh
# weekly backup script, run as a cron task
# Author: Simon Annetts simon@ateb.co.uk 2015-11-06

if [ "$1" = "test" ]; then
	d="-d dryrun"
else
	d="-d debug"
fi

# Get a list of datastores that a backup config might reside on. Could be a VMFS or NFS datastore.
# Supports more than one datastore containing a config, in this case ghettoVCB is run multiple times, one for each config found.
# The configs must be in a directory .ghettoVCB/${hostname} where ${hostname} is the name of the esxi host.

datastores=`df |awk '/^NFS|VMFS/{printf $6 " "}'`
hostname=`hostname`

for ds in ${datastores}; do
	fpath="${ds}/ghettoVCB/${hostname}"
	echo "Checking for configs in ${fpath}..."
	if [ -d "${fpath}" ] && [ -f "${fpath}/ghettoVCB.conf" ] && [ -f "${fpath}/weekly_backup_list.txt" ]; then
		# found a config so try and use it
		/opt/ghettoVCB/ghettoVCB.sh ${d} -g "${fpath}/ghettoVCB.conf" -f "${fpath}/weekly_backup_list.txt"
	fi
done

