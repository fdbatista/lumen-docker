FROM php:7.4.10
LABEL maintainer="fdbatista@gmail.com"

WORKDIR /var/www

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /bin/composer

RUN apt-get update \
  && apt-get install -y wget unzip git \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN wget https://get.symfony.com/cli/installer -O - | bash \
  && mv /root/.symfony/bin/symfony /bin/symfony

CMD [ "symfony", "server:start"]
