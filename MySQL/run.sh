#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/mysqld start
/bin/bash
