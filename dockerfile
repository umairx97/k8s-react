# Stage 1 - the build process
# Uses a small version of node which is `alpine`
FROM node:lts-alpine3.9

# Sets the working directory inside the image 
WORKDIR /usr/src/app

# Copy and create build for the react app 
COPY package.json yarn.lock ./
RUN yarn
COPY . ./
RUN yarn build

# Stage 2 - the production environment
FROM nginx:1.12-alpine

# --from=0 means to collect the artifacts from previous build stage
COPY --from=0 /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]