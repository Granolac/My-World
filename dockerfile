FROM debian:latest

RUN apt-get update
RUN apt-get install -y apache2

RUN echo '#!/bin/nash \nservice apache2 start \nsleep 5 \ntail -f /dev/null' >> /init.sh

RUN chmod 777 /init.sh

USER root
EXPOSE 80

ENTRYPOINT ["/bin/bash", "--", "/init.sh"]

CMD cp /var/lib/jenkins/workspace/Building-Web/index.html /var/www/html/index.html 
