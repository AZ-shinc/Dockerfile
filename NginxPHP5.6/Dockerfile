#NginxPHP on CentOS
#
#VERSION       1.0
#Software installed:
#					nginx1.8
#					php5.6
#

FROM wuhui/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root

#install nginx
RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

RUN yum install -y nginx

RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm

RUN yum -y install php56w-pecl-memcache.x86_64 php56w.x86_64 php56w-cli.x86_64 php56w-common.x86_64 php56w-gd.x86_64 php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pdo.x86_64 php56w-fpm.x86_64

##nginx conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

##php conf
RUN sed -e 's/;date\.timezone =/date\.timezone = Asia\/Shanghai/' -i /etc/php.ini


#RUN curl -sS https://getcomposer.org/installer | php
ADD ./composer /usr/local/bin/composer

ADD ./run.sh			/
RUN chmod 755 /run.sh
ADD ./murdoch.conf /etc/nginx/conf.d/

RUN mkdir -p /var/log/nginx/murdoch

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']

EXPOSE	80
