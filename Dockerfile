FROM node:alpine

WORKDIR '/app3'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx

COPY --from=0 /app3/build /usr/share/nginx/html