This wordpress with Redis configuration allows you to store a certain volume of keys and then, once the limit is reached, delete the oldest ones. Here, Redis behaves similarly to MemCached.

At this point if all goes well we can go to https://monsite.com/wp-admin and create an account for the administrator, then access WordPress.

Oh, that’s nice… That doesn’t mean it’s over.

For Redis to work, you’ll have to associate it with a plugin. I recommend W3 Total Cache which is the most popular and most complete.

For W3 Total Cache to discover Redis, it is necessary to fill in some variables in the mysite/wordpress/data/wp_config.php file, just before configuring the SQL database.

```
//
// redis config cache for total cache
//
define( 'W3TC_CONFIG_CACHE_ENGINE', 'redis');
define( 'W3TC_CONFIG_CACHE_REDIS_SERVERS', 'redis::6379' );
// optional redis settings
define( 'W3TC_CONFIG_CACHE_REDIS_PERSISTENT', true );
define( 'W3TC_CONFIG_CACHE_REDIS_DBID', 0 );
define( 'W3TC_CONFIG_CACHE_REDIS_PASSWORD', '' );
In Performance > General Settings, enable Redis for page (highly efficient), database, and object caching.
```
You will also find that sending emails does not work with the official WordPress container. This can be resolved by adding sendmail to the container. The limitation is that if your users report your mail as spam, it can damage the reputation of your domain. Many WordPress plugins allow you to use external mail services, such as WP Mail SMTP.

On the theme side, the leaders of the moment, such as Astra, Hello, OceanWP or Neve are making lightness a major selling point. Added to Redis, this allows you to take full advantage of the load time saving on SEO and user experience.

Several services offer to improve loading times by delivering media faster. There are CDNs such as StackPath or Cloudflare. Alternatively, you can use JetPack and enable options in Jetpack > Settings > Performance.

To help manage SEO, Yoast is a reference and is compatible with W3 Total Cache. Think about going to Performance > Extensions to allow it to integrate with the cache.

source: https://thibaut-deveraux.medium.com/a-docker-compose-file-to-install-wordpress-with-a-traefik-reverse-proxy-an-ssl-certificate-and-a-e878c2a03a17