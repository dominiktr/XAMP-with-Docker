FROM debian

ARG xampp_download_url="https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.4/xampp-linux-x64-8.2.4-0-installer.run"

RUN apt update
RUN apt upgrade -y
RUN apt install -y wget
RUN wget $xampp_download_url
RUN chmod +x xampp-linux-x64-*-installer.run
RUN ./xampp-linux-x64-*-installer.run
RUN echo '#!/bin/bash' > /startup.sh
RUN echo '/opt/lampp/xampp start' >> /startup.sh
RUN echo 'sleep infinity' >> /startup.sh
RUN chmod +x /startup.sh
CMD [ "/startup.sh" ]