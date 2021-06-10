# Original from JonasPed 
# under Apache 2.0 license

FROM python:3-alpine

WORKDIR /usr/src/app

RUN apk --no-cache add curl bash

RUN curl https://raw.githubusercontent.com/christgau/wsdd/v0.6.2/src/wsdd.py -o wsdd.py

COPY docker-cmd.sh healthcheck ./

RUN apk --no-cache add --virtual build-dependencies util-linux

RUN chmod +x docker-cmd.sh healthcheck

CMD [ "./docker-cmd.sh"]
