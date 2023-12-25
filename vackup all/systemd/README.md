# Vackup all: Backup and Restore Docker Volumes

Vackup all is a utility that uses the vackup by [BretFisher](https://github.com/BretFisher/docker-vackup) with small adjustments. Also in the systemd folder you will find the related service in case you want to schedule the backups.

## What is Vallbackup

Vallbackup: (contraction of "all volume backup")

Easily backup all Docker volumes using the `vackup` utility.

## Install

Download the `vackup` file in this repository to your local machine in your shell path and make it executable.

```shell
sudo curl -sSL https://raw.githubusercontent.com/synergops/docker-compose/main/vackup-all/systemd/vallbackup -o /usr/local/bin/vallbackup && sudo chmod +x /usr/local/bin/vallbackup
```

Lastly copy the `vackup-volume-backup.service` & `vackup-volume-backup.timer` in `/etc/systemd/system/` folder.

Enable and run them:

```
sudo systemctl enable --now vackup-volume-backup.service
sudo systemctl enable --now vackup-volume-backup.timer
```