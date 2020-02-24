# Extended Docker image to run a PHP:fpm

This Dockerfile will compile into a Docker image that is based on a [php:fpm](https://hub.docker.com/_/php/).
Additionally,

* it has the PHP-MySQL extension installed
* msmtp is installed to provide mail support

There is [an article about this Docker image](https://binfalse.de/2016/11/25/mail-support-for-docker-s-php-fpm/) in [my blog](https://binfalse.de).

As `sSMTP` is orphaned, I recently needed to migrate to `msmtp`.
Read more at [Migrating from sSMTP to msmtp](https://binfalse.de/2020/02/17/migrating-from-ssmtp-to-msmtp/).


## Configuration

### msmtp

Create a configuration file for [msmtp](https://marlam.de/msmtp/) to mount it to `/etc/msmtprc` of the container:

    defaults
    port 25
    tls off
    
    account default
    auth off
    host mail.server.tld
    domain php-fpm.yourdomain.tld
    from webserver@php-fpm.yourdomain.tld
    add_missing_date_header on


### PHP mail config

You need to tell PHP to use the sSMTP:

    [mail function]
    sendmail_path = "/usr/bin/msmtp -t"

Mount that file to `/usr/local/etc/php/conf.d/mail.ini`.

## More Information

Find [more information on how and why this is necessary](https://binfalse.de/2016/11/25/mail-support-for-docker-s-php-fpm/) in my blog.

