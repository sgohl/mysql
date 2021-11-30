FROM centos:7

ARG VER=5.7
ENV VER=$VER

ARG TEST=false
ENV TEST=$TEST

RUN yum makecache fast && yum -y update \
&&  yum -y install openssh-clients openssh-server pigz \
&&  ssh-keygen -A \
&&  yum -y install https://repo.percona.com/yum/percona-release-latest.noarch.rpm

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

###### FOR TESTING PURPOSES #####
#  - generates a keypair for master-slave replication POC
RUN if [[ $TEST = 'true' ]]; then cat /dev/zero | ssh-keygen -q -N "" ; fi
#################################

RUN ln -s /usr/local/bin/resetpw-$VER /usr/local/bin/resetpw \
&&  mv /etc/my.cnf-$VER /etc/my.cnf \
&&  rm -f /etc/my.cnf-* \
&&  chmod -R +x /usr/local/bin

CMD ["mysqld"]
