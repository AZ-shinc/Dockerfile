#NginxPHP on CentOS
#
#VERSION       1.0
#Software installed:
#					nginx1.8
#					php5.3.3
#

FROM nester/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root

#install nginx
RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

RUN yum install -y nginx

##install php-fpm
RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi

RUN yum install -y php-fpm
RUN yum install -y php-mysql
RUN yum install -y php-mbstring
RUN yum install -y wget

##install memcache
RUN yum install -y php-pecl-memcache


##nginx conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#ADD ./ip.conf /etc/nginx/conf.d/

##php conf
RUN sed -e 's/;date\.timezone =/date\.timezone = Asia\/Shanghai/' -i /etc/php.ini

ADD ./run.sh			/
RUN chmod 755 /run.sh

RUN mkdir -p /var/log/nginx/cupid

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']

EXPOSE	80
