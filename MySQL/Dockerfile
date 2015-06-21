#Mysql on CentOS
#
#VERSION       1.0
#Software installed:
#					mysql5.5
#

FROM nester/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root

RUN rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi

RUN yum --enablerepo=remi install -y mysql mysql-server


ADD ./run.sh			/
RUN chmod 755 /run.sh

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']

EXPOSE	3306
