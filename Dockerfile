# base node image
FROM node:16-bullseye as base

RUN apt-get update && apt-get install -y openssl

RUN mkdir /app
WORKDIR /app
ENV NODE_ENV=production

ADD . .

RUN yarn add @actual-app/web
RUN cd node_modules/@actual-app/web/build

CMD ["npx", "http-server", "."]
