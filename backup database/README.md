## What to change:

Open `db-in-volume-backup.sh` and adjust the following:

- DAYS= number of days to keep old backups. Default 3 days
- BACKUPDIR= absolute path to store the backups

Then copy `db-in-volume-backup.sh` to `/opt` folder. 
Lastly copy the `db-in-volume-backup.service` & `db-in-volume-backup.timer` in `/etc/systemd/system/` folder.

Enable and run them:

```
sudo systemctl enable --now db-in-volume-backup.service
sudo systemctl enable --now db-in-volume-backup.timer
```