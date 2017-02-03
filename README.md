# docker-lamp
# Edit by Tony Cheng

Docker container for [LAMP][1]

"Yoda LAMP is based on Ubuntu 14.04 LTS and MySQL 5.5 with PHP 5.5"

## Usage
To build the docker image using the command below:
    $ docker build --build-arg MYSQL_PASSWORD=xxxxxx -t "tonycheng/lamp:0.0.1" .

To run container use the command below:

    $ docker run -t -d -v /root/yoda-web:/root/yoda-web -p 7980:7980 tonychengtw/cacti:0.9.0 /bin/bash

## Data store
To backup use the command below:

     $ docker exec -it container_id /sbin/backup

Them backup data was created /var/backups/alldb_backup.sql.

To restore use the command below:

     $ docker exec -it container_id /sbin/restore

## More Info

About Yoda LAMP [www.cacti.net][1]

[1]:http://www.strongniche.com.tw
[2]:https://www.docker.com
[4]:http://docs.docker.com
[5]:https://github.com/TonyChengtw
