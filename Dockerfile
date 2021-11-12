FROM alpine:3.13.6

RUN apk add --update nodejs npm

RUN npm install mysql express

WORKDIR /app
COPY app.js /app

EXPOSE 3000
CMD [ "node", "app.js" ]