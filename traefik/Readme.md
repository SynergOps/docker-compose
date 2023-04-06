## Steps to Quick start

First ensure that nothing uses 80, 8080 ports.
Start your reverse-proxy with the following command:
```
docker compose -f docker-compose-traefik.yml up -d
```
### Traefik Detects New Services and Creates the Route for You

Start the whoami service with the following command:
```
docker compose -f docker-compose-whoami.yml up -d
```
Go back to your browser (http://localhost:8080/api/rawdata) and see that Traefik has automatically detected the new container and updated its own configuration.

When Traefik detects new services, it creates the corresponding routes so you can call them … let's see! (Here, we're using curl)
```
curl -H Host:whoami.docker.localhost http://127.0.0.1
```
Shows the following output:
```
Hostname: a656c8ddca6c
IP: 172.27.0.3
# ...
```
### More Instances? Traefik Load Balances Them
Run more instances of your whoami service with the following command:
```
docker compose -f docker-compose-whoami.yml up -d --scale whoami=2
```
Finally, see that Traefik load-balances between the two instances of your service by running the following command:
```
watch curl -H Host:whoami.docker.localhost <http://127.0.0.1>
```
Go back to your browser (http://localhost:8080/api/rawdata) and see that Traefik has automatically detected the new instance of the container.

# Traefi with Portainer

This setup comes up with the [Traefik](https://github.com/containous/traefik) v2.2.8 reverse proxy to access the Portainer instance via a virtual host, has support for SSL certificates using Let's Encrypt and automatic redirection from http to https.

The default configuration will make Portainer frontend available via the `portainer.yourdomain.com` domain. If you wish to change this, update the `traefik.http.routers.frontend.rule=Host(`portainer.yourdomain.com`)` label for the Portainer service in the `docker-compose.yml` file.

If you're going to use Edge agents. When you set up the endpoint from Portainer Configuration, you need to change the Portainer Server URL setting to match with the label specified for Edge. In this sample, the URL specified for the Edge service is `traefik.http.routers.frontend.rule=Host(`edge.yourdomain.com`)`.

![Edge](/traefik/edge.png)

Deploy this stack on any Docker node:

```
docker-compose up -d
```

And then access Portainer by hitting [http://portainer.yourdomain.com](http://portainer.yourdomain.com) with a web browser.

**NOTE**: Your machine must be able to resolve `portainer.yourdomain.com` (or your own domain if you updated it).