#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/php-fpm start
/bin/bash
