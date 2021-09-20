# Build phase; Install dependencies and build the project to get production assets

FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build --> all the stuff we care about


# Run phase; Copy production assets and run the nginx server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html




