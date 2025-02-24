# ---- STAGE 1: Build the app with Node ----
    FROM node:16-alpine AS build

    WORKDIR /app

    COPY package*.json ./

    RUN npm install

    COPY . .

    RUN npm run build

    # ---- STAGE 2: Serve with Nginx ----
    FROM nginx:alpine

    # Copy built files from the 'build' stage to Nginx www directory
    COPY --from=build /app/dist /usr/share/nginx/html

    EXPOSE 80

    # By default, Nginx in the alpine image runs on start
    CMD ["nginx", "-g", "daemon off;"]
