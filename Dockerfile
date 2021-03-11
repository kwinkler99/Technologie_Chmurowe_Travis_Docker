FROM node:14 AS builder
WORKDIR /usr/src/my-app
COPY ./my-app/package*.json ./
RUN npm install
COPY ./my-app/ .
EXPOSE 3000
RUN npm run build

FROM nginx 
COPY --from=builder /usr/src/my-app/build /usr/share/nginx/html