FROM centos:latest AS mysql

RUN yum makecache fast && yum -y update \
&&  yum -y install openssh-clients pigz \
&&  yum -y install https://repo.percona.com/yum/percona-release-latest.noarch.rpm

FROM mysql

ARG VER
ENV VER=$VER

COPY galera.repo /etc/yum.repos.d/

RUN yum -y install galera-3 mysql-wsrep-$VER mysql-wsrep-{client,devel,server,shared}-$VER \
&&  yum clean all

COPY dist /

RUN mv /etc/my.cnf-$VER /etc/my.cnf \
&&  rm -f /etc/my.cnf-*

CMD ["mysqld"]
