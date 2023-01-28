FROM node:16-alpine as builder


WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
# Copy from "builder" phase
# Nginx image will automatically start itself up
COPY --from=builder /app/build /usr/share/nginx/html
