## Steps to Quick start


```
docker compose up -d
```
### Usage

After configuring nginx proxy manager to forward a domain of you choice to port 8000, visit the domain to load a siple web app with an address bar for the website and some javascript that uses AJAX to hit a resource in the site (e.g test.html).

If you get any HTTP response other than 200 on the async callback, the site isn't working.
