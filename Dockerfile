FROM ubuntu:saucy

RUN apt-get -qq update
RUN apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/

EXPOSE 80

CMD nginx
