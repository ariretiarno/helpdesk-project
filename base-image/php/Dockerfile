FROM php:7.3-fpm

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions curl intl gd dom iconv xsl mbstring ctype zip pdo xml bz2 calendar exif fileinfo json posix tokenizer xmlwriter xmlreader phar soap mysqli \
    gmp bcmath apcu redis imagick imap xdebug mailparse

RUN apt update && apt install -y curl --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    # Make sure we're installing what we think we're installing!
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    # php composer-setup.php --version=1.0.0-alpha8
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
    && rm -f /tmp/composer-setup.*

ADD php.ini /usr/local/etc/php/conf.d/php.ini
ADD www.conf /usr/local/etc/php-fpm.d/www.conf

WORKDIR /usr/app
