FROM node:24-slim

RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app

COPY . .

RUN npm install

VOLUME /app/node_modules

EXPOSE 3000

CMD ["npm", "run", "dev"]