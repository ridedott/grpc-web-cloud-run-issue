### Build layer

FROM node:16-alpine as build

WORKDIR /run

COPY ./package*.json ./
COPY protos/helloworld.proto ./helloworld.proto
COPY ./server.js ./server.js

RUN npm ci

CMD [ "node", "/run/server.js"]
