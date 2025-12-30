# builder phase for building the react app with node image
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# it will generate production code at /app/build

# serving production code with nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html