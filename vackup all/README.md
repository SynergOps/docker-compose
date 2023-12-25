# Vackup all: Backup and Restore Docker Volumes

Vackup all is a utility that uses the vackup by [BretFisher](https://github.com/BretFisher/docker-vackup) with small adjustments. Also in the systemd folder you will find the related service in case you want to schedule the backups.

## What is Vackup
Vackup: (contraction of "volume backup")

Easily backup and restore Docker volumes using either tarballs or container images.  It's designed for running from any host/container where you have the docker CLI.

Note that for open files like databases, it's usually better to use their preferred backup tool to create a backup file,
but if you stored that file on a Docker volume, this could still be a way you get the Docker volume into a image or tarball for moving to remote storage for safe keeping.

Available options:
- `export`/`import` commands copy files between a local tarball and a volume.
For making volume backups and restores.

- `save`/`load` commands copy files between an image and a volume.
For when you want to use image registries as a way to push/pull volume data.

Usage:

-`vackup export VOLUME FILE`
  Creates a gzip'ed tarball in current directory from a volume

- `vackup import FILE VOLUME`
  Extracts a gzip'ed tarball into a volume

- `vackup save VOLUME IMAGE`
  Copies the volume contents to a busybox image in the /volume-data directory

- `vackup load IMAGE VOLUME`
  Copies /volume-data contents from an image to a volume

## Install

Download the `vackup` file in this repository to your local machine in your shell path and make it executable.

```shell
sudo curl -sSL https://raw.githubusercontent.com/SynergOps/docker-compose/main/vackup%20all/vackup -o /usr/local/bin/vackup && sudo chmod +x /usr/local/bin/vackup
```

## Error conditions

If any of the commands fail, the script will check to see if a `VACKUP_FAILURE_SCRIPT` environment variable is set.  If so it will run it and pass the line number the error happened on and the exit code from the failed command.  Eg,

```shell
# /opt/bin/vackup-failed.sh
LINE_NUMBER=$1
EXIT_CODE=$2
send_slack_webhook "Vackup failed on line number ${LINE_NUMBER} with exit code ${EXIT_CODE}!"
```

```shell
export VACKUP_FAILURE_SCRIPT=/opt/bin/vackup-failed.sh
./vackup export ......
```
