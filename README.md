# docker-lamp
# Edit by Tony Cheng

Docker container for [LAMP Yoda][1]

"Yoda LAMP is based on Ubuntu 14.04 LTS and MySQL 5.5 with PHP 5.5"

## Usage
To build the docker image which refers to Dockerfile using the command below:

$ docker build --build-arg MYSQL_PASSWORD=xxxxxx -t "tonycheng/web1:0.0.1" ./

To run container use the command below:

$ docker run -t -d --name web1 -v /root/docker-web1/html:/var/www/html -p 80:80 tonycheng/web1:0.0.1

## Docker Ignore File
Please refer .dockeringore

## Data store
To backup use the command below:

     $ docker exec -it container_id /sbin/backup

Them backup data was created /var/backups/alldb_backup.sql.

To restore use the command below:

     $ docker exec -it container_id /sbin/restore

## More Info
For more [info][2]

[1]:http://www.strongniche.com.tw
[2]:https://github.com/TonyChengtw
