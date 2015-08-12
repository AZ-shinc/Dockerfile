#!/bin/bash

/usr/sbin/sshd -D &

/etc/init.d/mysql start
/bin/bash
