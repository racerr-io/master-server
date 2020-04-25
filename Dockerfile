FROM alpine
RUN apk --no-cache --update add bash curl jq npm
COPY package*.json ./
RUN npm ci
COPY . .
RUN chmod +x scripts/GetBuild.sh
RUN npm run build
EXPOSE 3000
ENTRYPOINT ["node", "dist/server.js"]