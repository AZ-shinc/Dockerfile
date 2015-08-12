#Based on CentOS
#
#VERSION       1.0
#Software installed:
#					sshd
#					vim
#					git
#

FROM centos:6
MAINTAINER wuhui "wuhui@shinc.com"
ENV REFRESHED_AT 2015-05-29

ADD ./git-2.3.0.tar.gz	/root
ADD ./vim-7.3.tar.bz2	/root
ADD ./vim.tar.gz		/root

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

RUN yum clean all

RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

ADD ./run.sh			/
RUN chmod 755 /run.sh
RUN mkdir /root/.ssh
ADD ./authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

RUN rm -rf /root/git-2.3.0
RUN rm -rf /root/vim-7.3

RUN yum -y install sudo

#RUN useradd admin
RUN echo "root:root" | chpasswd
#RUN echo "admin		ALL=(ALL)		ALL"	>> /etc/sudoers

CMD ['/run.sh']

EXPOSE	22
