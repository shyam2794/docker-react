FROM node:12.18.2-alpine3.12 as builder

WORKDIR /app

COPY ./package.json .

RUN npm install 

COPY . .

RUN npm run build

FROM nginx:1.19.1

# copy the build folder generated from the previous phase 
COPY --from=builder /app/build /usr/share/nginx/html
