# Vackup all: Backup and Restore Docker Volumes

Vackup all is a utility that uses the vackup by [BretFisher](https://github.com/BretFisher/docker-vackup) with small adjustments. Also in the systemd folder you will find the related service in case you want to schedule the backups.

## What is Vallbackup

Vallbackup: (contraction of "all volume backup")

Easily schedule the backup of all Docker volumes using the `vackup` utility, once every day.

## Install

Download the `vackup` file in this repository to your local machine in your shell path and make it executable.

```shell
sudo curl -sSL https://raw.githubusercontent.com/SynergOps/docker-compose/main/vackup%20all/systemd/vallbackup -o /usr/local/bin/vallbackup && sudo chmod +x /usr/local/bin/vallbackup
```
Create the default folder where the backups will be saved

```
mkdir /home/ubuntu/vallbackup-local
```
If you need to change the default folder, please edit `vallbackup` and change the value of `pathroot=` with your prefered path.
Note: The folder should be an existing folder

Lastly copy the `vackup-volume-backup.service` & `vackup-volume-backup.timer` in `/etc/systemd/system/` folder.

Enable and run them:

```
sudo systemctl enable --now vackup-volume-backup.service
sudo systemctl enable --now vackup-volume-backup.timer
```
