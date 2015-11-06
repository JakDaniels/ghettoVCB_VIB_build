Build on linux using:

vibauthor -C -t stage -v ghettoVCB.vib -O ghettoVCB-offline-bundle.zip -f
cp ghettoVCB-offline-bundle.zip ghettoVCB.vib /mnt/nfs/ghettoVCB/

Install on each ESXi host using:

esxcli software vib install -v /vmfs/volumes/backup1/ghettoVCB/ghettoVCB.vib -f
esxcli software vib list


Test a daily or weekly backup job:

/opt/ghettoVCB/daily_backup.sh test
/opt/ghettoVCB/weekly_backup.sh test

Configs go in a datastore e.g.

/vmfs/volumes/backup1/ghettoVCB/ghettoVCB.conf
/vmfs/volumes/backup1/ghettoVCB/daily_backup_list.txt
/vmfs/volumes/backup1/ghettoVCB/weekly_backup_list.txt

