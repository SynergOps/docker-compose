# Minimal Static Web Page Server

A very small Docker image (~154KB) to run any static website, based on the [BusyBox httpd](https://www.busybox.net/) static file server.

## Quick Start

If you just want to use the default page that comes with the image, run:
```
docker compose up -d
```

## Build your own

Put your static html files in the `html` folder

Build the image:

```sh
docker build -t my-static-website .
```

Run the image:

```sh
docker run -it --rm --init -p 80:80 my-static-website
```

Browse to `http://localhost`.


If you need to configure the server in a different way, you can override the `CMD` line:

```dockerfile
....
CMD ["/busybox", "httpd", "-f", "-v", "-p", "80", "-c", "httpd.conf"]
```

## Development and Release

Build the image:

```
docker build -t yourDockerHub/mini-static-server:1.2.3 -t yourDockerHub/mini-static-server:latest .
```

Push the image to Docker Hub:

```
docker push yourDockerHub/mini-static-server:1.2.3
docker push yourDockerHub/mini-static-server:latest
```

Tag the release:

```
git tag 1.2.3
git push --tags
```

[credits: lipanski](https://github.com/lipanski/docker-static-website)