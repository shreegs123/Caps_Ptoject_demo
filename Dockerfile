FROM node:14.9.0 AS build


WORKDIR /Caps_Ptoject_demo
COPY package.json package-lock.json ./
RUN npm install


COPY . .
RUN npm run build


FROM nginx:1.18-alpine
COPY --from=build /Caps_Ptoject_demo /usr/share/nginx/html
