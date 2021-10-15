FROM centos:7 AS mysql

RUN yum makecache fast && yum -y update \
&&  yum -y install openssh-clients pigz \
&&  yum -y install https://repo.percona.com/yum/percona-release-latest.noarch.rpm

FROM mysql

ARG VER
ENV VER=$VER

COPY mysql.repo /etc/yum.repos.d/mysql.repo

RUN sed -i "s/VER/$VER/g" /etc/yum.repos.d/mysql.repo \
&&  yum -y install mysql-community-server \
&&  case $VER in \
      8.0) percona-release setup ps80 && yum -y install percona-xtrabackup-80 ;; \
      5.*) yum -y install mysql-community-libs-compat percona-xtrabackup-24 ; \
           if [[ $VER == '5.7' ]]; then yum -y install mysql-shell; fi \
    ;; esac \
&&  yum clean all

COPY dist /

RUN ln -s /usr/local/bin/resetpw-$VER /usr/local/bin/resetpw \
&&  mv /etc/my.cnf-$VER /etc/my.cnf \
&&  rm -f /etc/my.cnf-* \
&&  chmod -R +x /usr/local/bin

CMD ["mysqld"]
