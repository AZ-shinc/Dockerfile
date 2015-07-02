#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/php-fpm start
/etc/init.d/nginx start
/bin/bash
