FROM alpine:latest

WORKDIR /usr/src

RUN apk --no-cache add nodejs npm git

RUN git clone https://github.com/greghesp/assistant-relay.git

WORKDIR /usr/src/assistant-relay

COPY config.json ./server/configurations
COPY boosey.json ./server/configurations/secrets
COPY boosey-tokens.json ./server/configurations/tokens

RUN npm install

# RUN apk del git npm

EXPOSE 8383

ENTRYPOINT npm run start
