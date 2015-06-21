#Nginx on CentOS
#
#VERSION       1.0
#Software installed:
#					nginx1.8
#

FROM nester/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root

#install nginx
RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN yum install -y nginx

##nginx conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./test.conf /etc/nginx/conf.d/

ADD ./run.sh			/
RUN chmod 755 /run.sh


ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']

EXPOSE  80
