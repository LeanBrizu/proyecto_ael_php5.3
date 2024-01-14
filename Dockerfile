# Usamos la imagen base de orsolin/docker-php-5.3-apache.
# Basado en Apache/2.4.53 (Debian)
FROM orsolin/docker-php-5.3-apache

# Instalación de módulos de PHP
# RUN docker-php-ext-install -j$(nproc) \
#     mcrypt \
#     intl \
#     opcache \
#     zip \
#     exif \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install -j$(nproc) gd

# Copiamos los archivos de la aplicación a /var/www/html
COPY ./app/src /var/www/html

# Establecemos el directorio de trabajo
WORKDIR /var/www/html

# Habilitamos el módulo de Apache 'rewrite'
RUN a2enmod rewrite

# Cambiamos el ID del usuario www-data a 1000
RUN usermod -o -u 1000 www-data

# Comando que se ejecutará al iniciar un contenedor basado en esta imagen
# CMD [ "php", "./your-script.php" ]
