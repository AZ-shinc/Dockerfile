#Based on CentOS
#
#VERSION       1.0
#Software installed:
#					Tengine	

FROM wuhui/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

ADD ./tengine-2.1.0.tar.gz	/root


WORKDIR /root

#install pcre pcre-devel openssl openssl-devel
#compile nginx http ssl  need
RUN yum -y install pcre pcre-devel openssl openssl-devel

#install Tengine
RUN cd tengine-2.1.0 && ./configure && make && make install

ADD ./run.sh				/
RUN chmod 755 /run.sh


ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']


EXPOSE	80
