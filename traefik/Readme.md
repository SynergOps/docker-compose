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