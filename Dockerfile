### Build layer

FROM node:16-alpine as build

WORKDIR /run

COPY ./package*.json ./
COPY protos/helloworld.proto ./helloworld.proto
COPY ./server*.js ./
COPY ./certs/* ./certs/

RUN npm ci

#CMD [ "node", "/run/server-ssl.js"]
CMD [ "node", "/run/server.js"]
