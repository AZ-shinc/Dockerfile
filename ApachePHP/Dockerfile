#ApachePHP on CentOS
#
#VERSION       1.0
#Software installed:
#					apache2.2.15
#					php5.6
#

FROM nester/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root

#install apache
RUN yum install -y httpd


RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
##install php-fpm
#RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
#RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
#RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi

#RUN yum install -y php-fpm
#RUN yum install -y php-mysql
#RUN yum install -y php-mbstring
#RUN yum install -y wget

##install memcache
#RUN yum install -y php-pecl-memcache

RUN yum -y install php56w.x86_64 php56w-cli.x86_64 php56w-common.x86_64 php56w-gd.x86_64 php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pdo.x86_64 php56w-fpm.x86_64

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

##php conf
#RUN sed -e 's/;date\.timezone =/date\.timezone = Asia\/Shanghai/' -i /etc/php.ini

ADD ./run.sh			/
RUN chmod 755 /run.sh

#RUN mkdir -p /var/log/nginx/cupid

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

ADD ./Murdoch.conf /etc/httpd/conf.d/

CMD ['/run.sh']

EXPOSE	80
EXPOSE	22
