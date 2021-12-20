FROM ampersandtarski/prototype-framework:v1.10.3

# Lines to add specific compiler version (from Github releases)
# ADD https://github.com/AmpersandTarski/Ampersand/releases/download/Ampersand-v4.1.0/ampersand /usr/local/bin/ampersand
# RUN chmod +x /usr/local/bin/ampersand
# Line to add specific compiler version (from Ampersand image)
# COPY --from=ampersandtarski/ampersand:development /bin/ampersand /usr/local/bin

# The script content
COPY big /usr/local/project/

WORKDIR /usr/local/project/generiek

# Generate prototype application from folder
RUN ampersand proto Main.adl \
  --proto-dir /var/www \
  --verbose

RUN chown -R www-data:www-data /var/www/log /var/www/data /var/www/generics \
 && cd /var/www
 # uncomment lines below if customizations are added to default prototype framework
 # && composer install --prefer-dist --no-dev --optimize-autoloader --profile \
 # && npm install \
 # && gulp build-ampersand \
 # && gulp build-project
