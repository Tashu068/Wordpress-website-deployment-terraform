# Use the official PHP 7.4 Apache base image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Set an ARG for the WordPress version
ARG WORDPRESS_VERSION=5.8

# Copy the WordPress files to the working directory
COPY . /var/www/html

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libjpeg-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo_mysql gd mbstring exif pcntl bcmath opcache

# Download and install WordPress
RUN wget -q https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz && \
    tar -xzf wordpress-${WORDPRESS_VERSION}.tar.gz --strip-components=1 && \
    rm wordpress-${WORDPRESS_VERSION}.tar.gz && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Set the entrypoint to Apache
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
