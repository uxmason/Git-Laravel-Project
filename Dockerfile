FROM php:7.4-fpm
USER root

# Install dependencies
RUN apt-get update \
	# gd
	&& apt-get install -y --no-install-recommends build-essential  openssl nginx libfreetype6-dev libjpeg-dev libpng-dev libwebp-dev zlib1g-dev libzip-dev gcc g++ make vim unzip curl git jpegoptim optipng pngquant gifsicle locales libonig-dev nodejs npm  \
	&& docker-php-ext-configure gd  \
	&& docker-php-ext-install gd \
	# gmp
	&& apt-get install -y --no-install-recommends libgmp-dev \
	&& docker-php-ext-install gmp \
	# pdo_mysql
	&& docker-php-ext-install pdo_mysql mbstring \
	# pdo
	&& docker-php-ext-install pdo \
	# opcache
	&& docker-php-ext-enable opcache \
	# zip
	&& docker-php-ext-install zip \
	&& apt-get autoclean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/pear/ 

# Install MS ODBC Driver for SQL Server
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt-get update \
#     && apt-get -y --no-install-recommends install msodbcsql17 unixodbc-dev \
#     && pecl install sqlsrv \
#     && pecl install pdo_sqlsrv \
#     && echo "extension=pdo_sqlsrv.so" >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini \
#     && echo "extension=sqlsrv.so" >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-sqlsrv.ini \
#     && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Copy files
COPY . /var/www

COPY ./docker-files/php/local.ini /usr/local/etc/php/local.ini

COPY ./docker-files/nginx/conf.d/app.conf /etc/nginx/nginx.conf    

RUN chmod +rwx /var/www

RUN chmod -R 777 /var/www

# setup npm
RUN npm install -g npm@latest
RUN npm install
RUN npm install laravel-mix@latest
# run your default build command here mine is npm run prod
# RUN npm run dev

# setup composer and laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --working-dir="/var/www" 

RUN composer dump-autoload --working-dir="/var/www" 

# RUN composer require tcg/voyager
# RUN export COMPOSER_ALLOW_SUPERUSER=1 
#RUN php artisan route:clear

#RUN php artisan route:cache

#RUN php artisan config:clear

#RUN php artisan config:cache

EXPOSE 80

#RUN ["chmod", "+x", "post_deploy.sh"]

#CMD [ "sh", "./post_deploy.sh" ]
