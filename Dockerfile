# MULTI STEP BUILD PROCESS

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# all the build we care about will be inside /app/build
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html