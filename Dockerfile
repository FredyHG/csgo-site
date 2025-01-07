# Use a imagem oficial do PHP 8.1
FROM php:8.1-fpm

# Instale extensões necessárias (exemplo: mysqli e pdo_mysql)
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql mysqli zip

# Instale o Composer (opcional, caso necessário)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copie os arquivos da aplicação para o contêiner
WORKDIR /var/www/html
COPY . .

# Exponha a porta padrão do PHP-FPM
EXPOSE 9000

# Inicia o servidor PHP-FPM
CMD ["php-fpm"]