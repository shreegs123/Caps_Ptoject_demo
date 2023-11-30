FROM node:14.9.0 AS build


WORKDIR /Capstone-Project
COPY package.json package-lock.json ./
RUN npm install


COPY . .
RUN npm run build


FROM nginx:1.18-alpine
COPY --from=build /Capstone-Project/build /usr/share/nginx/html
