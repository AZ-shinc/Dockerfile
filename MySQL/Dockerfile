#Mysql on CentOS
#
#VERSION       1.0
#Software installed:
#					mysql5.5.45
#

FROM wuhui/base:1
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

WORKDIR /root


ADD ./mysql-5.5.45.tar.gz	/root

RUN yum -y install cmake

RUN	cd /root/mysql-5.5.45 && cmake \
								-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
								-DMYSQL_DATADIR=/usr/local/mysql/data \
								-DSYSCONFDIR=/etc \
								-DWITH_MYISAM_STORAGE_ENGINE=1 \
								-DWITH_INNOBASE_STORAGE_ENGINE=1 \
								-DWITH_MEMORY_STORAGE_ENGINE=1 \
								-DWITH_READLINE=1 \
								-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \
								-DMYSQL_TCP_PORT=3306 \
								-DENABLED_LOCAL_INFILE=1 \
								-DWITH_PARTITION_STORAGE_ENGINE=1 \
								-DEXTRA_CHARSETS=all \
								-DDEFAULT_CHARSET=utf8 \
								-DDEFAULT_COLLATION=utf8_general_ci && make && make install

RUN groupadd mysql
RUN useradd -g mysql mysql

RUN chown -R mysql:mysql /usr/local/mysql

RUN cd /usr/local/mysql && scripts/mysql_install_db --basedir=/usr/local/mysql --datadir=/var/lib/mysql --user=mysql

RUN cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql

RUN echo "PATH=/usr/local/mysql/bin:\$PATH;export PATH" >> /etc/profile
RUN	source /etc/profile

RUN cp /usr/local/mysql/support-files/my-medium.cnf /etc/my.cnf

ADD ./run.sh			/
RUN chmod 755 /run.sh

ADD ./authorized_keys /root/.ssh/authorized_keys_tmp
RUN cat /root/.ssh/authorized_keys_tmp >> /root/.ssh/authorized_keys
RUN rm -f authorized_keys_tmp

CMD ['/run.sh']

EXPOSE	3306
