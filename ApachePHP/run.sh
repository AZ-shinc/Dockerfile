#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/httpd start
/etc/init.d/php-fpm start
/bin/bash
