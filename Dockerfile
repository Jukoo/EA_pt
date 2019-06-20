# this Dockerfile allow you to run the script 
# no matter the distro you run localy 
#------------------------------------------
# based image 
FROM debian:latest 

MAINTAINER  Juko <funscript@oulook.fr> 


RUN apt-get update  \ 
&& apt-get install php7.0-fpm    -y \ 
&& apt-get install git           -y \ 
&& apt-get install php7.0-curl   -y \  
&& apt-get install openssl       -y \ 
&& apt-get install bats          -y

ADD . /Hspot

WORKDIR /Hspot 

RUN sed -i s/disabled/enable/g hspot
