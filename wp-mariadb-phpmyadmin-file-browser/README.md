# Wordpress on MariaDB with Phpmyadmin and FileBrowser

This is a `docker-compose.yml` file to set up a WordPress environment with the latest stable versions of WordPress, MariaDB, and phpMyAdmin. It also includes FileBrowser as a web-based file explorer and is configured to allow file uploads of up to `500MB`. 

This setup uses relative folder paths (./mariadb_data and ./wordpress) to store your database and WordPress files directly on your host machine within your project directory.  The uploads.ini file is mounted into the WordPress container to ensure your PHP settings for file uploads are applied. This is a good environment for local development and testing.

## How to Run

- Save the files: Make sure both docker-compose.yml and uploads.ini are in the same directory.
- Update passwords: Before running, replace your_strong_root_password and your_strong_user_password in the docker-compose.yml file with secure passwords.
- Start the services: Open a terminal in the directory where you saved the files and run the following command:
```
docker-compose up -d
```
## Accessing the Services
- WordPress: Open your web browser and navigate to http://localhost.
- phpMyAdmin: Access it at http://localhost:8080.
- FileBrowser: Manage your WordPress files at http://localhost:8081. The default username and password for the first login is admin/admin. It is highly recommended to change these credentials immediately after your first login.

