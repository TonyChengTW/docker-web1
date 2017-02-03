#name of container: docker-cacti
#FROM tonychengtw/lamp:0.0.1
FROM ubuntu:14.04
MAINTAINER Tony Cheng <tony.pig@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 
ARG MYSQL_PASSWORD

# adjust time
RUN cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# install packages
RUN echo "mysql-server-5.5 mysql-server/root_password password ${MYSQL_PASSWORD}"| debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password ${MYSQL_PASSWORD}"| debconf-set-selections
RUN apt-get update && apt-get install -yq  build-essential \ 
                      supervisor \
#                      htop vim net-tools git curl wget  \
#                      apache2 libapache2-mod-php5 php5-mysql php5-gd php5-curl php-pear php-apc \		
                      mysql-server-5.5 

#WORKDIR /root/yoda-web
# copy supervisord related files
COPY supervisord.conf /etc/supervisor
COPY supervisord-apache2.conf /etc/supervisor/conf.d/
COPY supervisord-mysql.conf /etc/supervisor/conf.d/


# copy apache related files
COPY www.strongniche.com.tw.conf /etc/apache2/sites-enabled

#COPY allDB.sql.gz ./
#RUN gunzip allDB.sql.gz
#RUN mysqld &
#RUN mysql -u root -p${MYSQL_PASSWORD} < allDB.sql

# to add mysqld deamon to runit
#RUN mkdir -p /etc/service/snmpd /var/log/snmpd ; sync 
#COPY snmpd.sh /etc/service/snmpd/run
#RUN chmod +x /etc/service/snmpd/run  \
#    && cp /var/log/cron/config /var/log/snmpd/ \
#    && chown -R snmp /var/log/snmpd
#
#COPY pre-conf.sh /sbin/pre-conf
#RUN chmod +x /sbin/pre-conf ; sync \
#    && /bin/bash -c /sbin/pre-conf \
#    && rm /sbin/pre-conf
#
#COPY spine.conf /etc/cacti/spine.conf
#
EXPOSE 80
#
CMD ["/usr/bin/supervisord"]
