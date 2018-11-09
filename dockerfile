FROM debian:latest

RUN apt-get update
RUN apt-get install -y apache2

RUn echo '#!/bin/nash \nservice apache2 start \nsleep 5 \ntail -f /dev/null' >> /init.sh

RUN chmod 777 /init.sh

USER root
EXPOSE 80

ENTRYPOINT ["/bin/bash", "--", "/init.sh"]
