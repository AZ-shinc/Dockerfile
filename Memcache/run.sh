#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/memcached start
/bin/bash
