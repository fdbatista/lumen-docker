FROM php:7.4.10
LABEL maintainer="fdbatista@gmail.com"

EXPOSE 8000
CMD php -S 0.0.0.0:8000 -t /app/public
