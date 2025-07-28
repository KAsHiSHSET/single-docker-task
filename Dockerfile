FROM node:20

WORKDIR /app

COPY . .

RUN npm install -g pm2 && npm install

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js"]