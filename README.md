To build:

    docker build -rm -t docker-nginx .

To run:

    docker run -p 8080:80 -v $PWD/public:/var/www -i -t docker-nginx


This will serve all the files in **public** via [nginx][2] in a [Docker][1] container.

[1]: https://www.docker.io/
[2]: http://nginx.org/
