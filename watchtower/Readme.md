## Watchtower with the safest modes enabled

By default, with this docker compose, Watchtower will check for updates every 24 hours from the moment you start the Watchtower container. You’ll now need to add labels to your docker containers that you’d like to update which is described below.

The above docker-compose file is safe by default so that it won’t do anything other than update itself. 

To update your other docker containers you need to add a label to their docker-compose file that sets **com.centurylinklabs.watchtower.enable=true**. Watchtower will then pick up that label and know that it needs to include that docker container (or service) in it’s updates.

Example:

```
version: '3'

services:
   apache:
   .....
   labels:
      - "com.centurylinklabs.watchtower.enable=true"
```