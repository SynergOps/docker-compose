FROM wordpress
# printf statement mocks answering the prompts from the pecl install
RUN printf "\n \n" | pecl install redis && docker-php-ext-enable redis
RUN /etc/init.d/apache2 restart
#This file will simply take the official WordPress image and 
#add a PHP module capable of handling Redis.