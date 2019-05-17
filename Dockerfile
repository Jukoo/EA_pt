# this Dockerfile allow you to run the script 
# no matter the distro you run localy 
#------------------------------------------
# based image 
FROM debian:latest 

MAINTAINER  Juko <funscript@oulook.fr> 

ENV AUTO_AGREEMENT  --assume-yes 

RUN apt-get update                  $AUTO_AGREEMENT 
RUN apt-get upgrade                 $AUTO_AGREEMENT 
RUN apt-get install php7.0-fpm      $AUTO_AGREEMENT 
RUN apt-get install git             $AUTO_AGREEMENT 
RUN apt-get install php7.0-curl     $AUTO_AGREEMENT
RUN apt-get install openssl         $AUTO_AGREEMENT
# By default the status based in the hspot file is off
ENV DFILE_RUN           "enable"
ENV SCRIPT_NAME         beehive 
ENV SCRIPT_CONF_TARGET  hspot  
ADD ./hspot  .
RUN sed -i s/disabled/enable/g hspot  


ENTRYPOINT ["./hspot"]  

CMD ["-ds"] 
