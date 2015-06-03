#!/bin/bash

/usr/sbin/sshd -D &
/etc/init.d/nginx start
/bin/bash
