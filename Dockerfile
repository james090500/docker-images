FROM debian:latest
FROM php:8.3-fpm

# Set the work dir
ENV WEB_DIR=/var/www/html
WORKDIR $WEB_DIR

# Install required PHP Extensions
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions curl dom redis zip xml mysqli mongodb bcmath intl

# Install Node
RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get -y install -y nodejs

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer