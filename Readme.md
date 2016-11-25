# Extended Docker image to run a PHP:fpm

This Dockerfile will compile into a Docker image that is based on a [php:fpm](https://hub.docker.com/_/php/).
Additionally,

* it has the PHP-MySQL extension installed
* sSMTP is installed to provide mail support

There is [an article about this Docker image](https://binfalse.de/2016/11/25/mail-support-for-docker-s-php-fpm/) in [my blog](https://binfalse.de).


## Configuration

### sSMTP

Create a configuration file for [sSMTP](https://packages.qa.debian.org/s/ssmtp.html) to mount it to `/etc/ssmtp/ssmtp.conf` of the container:

    FromLineOverride=YES
    mailhub=mail.server.tld
    hostname=php-fpm.yourdomain.tld
    UseTLS=YES
    UseSTARTTLS=YES


### PHP mail config

You need to tell PHP to use the sSMTP:

    [mail function]
    sendmail_path = "/usr/sbin/ssmtp -t"

Mount that file to `/usr/local/etc/php/conf.d/mail.ini`.

## More Information

Find [more information on how and why this is necessary](https://binfalse.de/2016/11/25/mail-support-for-docker-s-php-fpm/) in my blog.

