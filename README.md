# cloudflare-ddns-docker

I use healthcheck as cron :D  

To see log, run
```bash
docker inspect --format "{{json .State.Health }}" cloudflare-ddns-docker_updater_1
```
