FROM alpine
RUN apk --no-cache --update add bash curl jq npm
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 3000
ENTRYPOINT ["node", "dist/server.js"]