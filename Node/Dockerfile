#Node on CentOS
#
#VERSION       1.0
#Software installed:
#					Node0.12.4
#

FROM wuhui/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

ADD ./node-v0.12.4.tar.gz	/root


WORKDIR /root

#install node 0.12.4
RUN cd node-v0.12.4 && ./configure && make && make install

RUN cp /usr/local/bin/node	/usr/sbin/
RUN cp /usr/local/bin/npm	/usr/sbin/npm

#RUN npm install -g express
RUN npm install -g supervisor

#RUN cp /usr/local/bin/supervisor /usr/sbin/


ADD ./run.sh			/
RUN chmod 755 /run.sh

RUN yum clean all

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ["/run.sh"]

EXPOSE	3000
