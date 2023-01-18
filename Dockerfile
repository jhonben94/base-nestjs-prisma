# Copyright (c) 2020, 2021 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
FROM node:16.2.0-alpine

WORKDIR workdir
COPY ./ /workdir

ENV TZ=America/Asuncion

RUN apk add git

RUN npm install
RUN npm run prisma:gen
#COPY ./src/utils/KUDEGen.js /workdir/node_modules/facturacionelectronicapy-kude/dist
#RUN npm run build
CMD ["npm", "run", "dev"]