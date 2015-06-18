#Node on CentOS
#
#VERSION       1.0
#Software installed:
#					sshd
#					vim
#					git
#					Node0.12.4
#

FROM centos:6
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

ADD ./git-2.3.0.tar.gz		/root
ADD ./vim-7.3.tar.bz2		/root
ADD ./vim.tar.gz			/root
ADD ./node-v0.12.4.tar.gz	/root


WORKDIR /root

#Update software library
RUN yum -y update

#install development tools
RUN yum -y groupinstall 'Development Tools'

#install sshd
RUN yum -y install openssh-server

#install tar
RUN yum -y install tar

#install zlib zlib-devel perl-devel
#compile git need
RUN yum -y install zlib zlib-devel perl-devel

#install git 2.3.0
RUN cd git-2.3.0 && ./configure && make && make install

#install ncurses ncurses-devel
RUN yum -y install ncurses ncurses-devel

#install vim 7.3
RUN cd vim73 && ./configure --enable-netbeans --disable-selinux --enable-multibyte --enable-fontset --with-vim-name=vi --with-features=huge && make && make install

#install node 0.12.4
RUN cd node-v0.12.4 && ./configure && make && make install

RUN cp /usr/local/bin/node	/usr/sbin/
RUN cp /usr/local/bin/npm	/usr/sbin/npm

RUN npm install -g express
RUN npm install -g supervisor

#RUN cp /usr/local/bin/supervisor /usr/sbin/

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key


ADD ./run.sh			/
RUN chmod 755 /run.sh
ADD ./authorized_keys /root/.ssh/authorized_keys

RUN yum clean all

CMD ["/run.sh"]

EXPOSE	22
EXPOSE	3000
