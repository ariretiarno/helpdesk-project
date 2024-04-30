FROM 107126629234.dkr.ecr.ap-southeast-1.amazonaws.com/uv-desk:base-image-php73-fpm

ADD . .

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install 
EXPOSE 9000
