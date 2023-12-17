# Backup in Linux Servers - Docker Volumes, and Databases
You can use this perfectly in combination with Docker Volumes and Databases.
We will use the free and open-source software Duplicati.

Project Homepage: https://www.duplicati.com
Documentation: https://duplicati.readthedocs.io/en/latest/
Source Files: https://github.com/duplicati/duplicati

## Prerequisites

- Linux Server running Ubuntu 20.04 LTS or newer
- Docker and Docker Ccompose installed
- Domain that points to the public IP of your Linux Server

You can still install Docker on a Linux Server that is not running Ubuntu, however, this may require different commands!

## 1. Set up Duplicati

### 1.1. Create a Docker-Compose file

Create a new `docker-compose.yml` file in your project folder e.g. `/home/<your-username>/nextcloud`.

*You can also create a new folder in the `/opt` directory, this may require different permissions.*

### 2. Start Duplicati

Navigate to your project folder, and execute the following command.

```bash
docker-compose up -d
```

### 2.1 Configure Duplicati

Open the web interface of **Duplicati** at `http://your-server-address:8200`, and create a password

Read the [Duplicati Documentation](https://duplicati.readthedocs.io/en/latest/) to learn how to use it