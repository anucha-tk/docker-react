# multi-state nginx
# state one node
FROM node:16-alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# state two
# capy result state one to state two
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html