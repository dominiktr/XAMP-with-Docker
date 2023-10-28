FROM debian:bookworm-slim

# Define the XAMPP download URL
ARG xampp_download_url="https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.4/xampp-linux-x64-8.2.4-0-installer.run"

# Update OS and install wget
RUN apt update \
    && apt upgrade -y \
    && apt install -y wget

# Install XAMPP
RUN wget $xampp_download_url \
    && chmod +x xampp-linux-x64-*-installer.run \
    && ./xampp-linux-x64-*-installer.run

# Create a startup script
# The line 'sleep infinity' prevents the container from stopping
RUN echo '#!/bin/bash' > /startup.sh \
    && echo '/opt/lampp/xampp start' >> /startup.sh \
    && echo 'sleep infinity' >> /startup.sh \
    && chmod +x /startup.sh

# Allow access from LAN to XAMPP admin page
# (required to open phpMyAdmin on the Docker host machine)
RUN echo '<LocationMatch "^/(?i:(?:xampp|security|licenses|phpmyadmin|webalizer|server-status|server-info))">' >> /opt/lampp/apache2/conf/httpd.conf \
    && echo '    Require all granted' >> /opt/lampp/apache2/conf/httpd.conf \
    && echo '    ErrorDocument 403 /error/XAMPP_FORBIDDEN.html.var' >> /opt/lampp/apache2/conf/httpd.conf \
    && echo '</LocationMatch>' >> /opt/lampp/apache2/conf/httpd.conf

CMD [ "/startup.sh" ]