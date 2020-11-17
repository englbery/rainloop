# englbery/rainloop
This project aims to provide a minimalist and efficient docker image for rainloop webmail. 
To achieve this, this image is based on the latest [alpine distribution](https://alpinelinux.org/) and uses [lighttpd](https://www.lighttpd.net/) as webserver. 

## Rainloop

Rainloop is a simple, modern and fast web-based email client supporting IMAP and SMTP protocols with SSL and STARTTLS. There is a direct access to the mail server in use and no emails are stored on the web server. [Click](https://www.rainloop.net/features/) for more information. 

You can try out a [live system](https://www.rainloop.net/try-now/) at their website.

RainLoop Webmail (Community edition) is released under GNU AFFERO GENERAL PUBLIC LICENSE Version 3 (AGPL) and maintained on [github](https://github.com/RainLoop/rainloop-webmail).

## Installation
### Build image yourself
To build the image itself clone the repository and open the directory with the docker file in your terminal. 
To build the image execute the following command:

    docker build -t englbery/rainloop .

### Docker Hub
Alternatively, the docker image can be obtained directly from [docker hub.](https://hub.docker.com/) To do so, execute the following command.

    docker pull englbery/rainloop
    
### Run docker image
To run the docker image you can use the following example command.
```
docker run -p 8080:80 -d englbery/rainloop
``` 

### Docker compose
You can also use the image in docker compose for example to run a database (mySQL or PostgreSQL) to store contacts in Rainloop.
 - [mySQL on docker hub](https://hub.docker.com/_/mysql)
 - [mariadb on docker hub](https://hub.docker.com/_/mariadb)

Minimal example: (docker-compose.yml)
```
version: "3"

services:
  rainloop:
    image: englbery/rainloop
    ports:
      - "8080:80"
```

### Run docker compose 
To run the docker compose you can use the following command.
```
docker-compose up -d
```
Note: When you run the command make sure the docker-compose.yml file is in your working directory. 

## Configuration

After the container is running you can reach rainloop under localhost:8080 (respectively yourip/yourdomain:8080 or the port you specified).

You can configure rainloop in the admin panel by calling localhost:8080/?admin

Default username: admin

Default password: 12345

Make sure to changes these asap.

[Click](https://www.rainloop.net/docs/configuration/) for more information. 
