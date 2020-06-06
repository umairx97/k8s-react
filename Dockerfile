# Stage 1 - the build process
# Uses a small version of node which is `alpine`
FROM node:lts-alpine3.9

# Sets the working directory inside the image 
WORKDIR /usr/src/app

# Copy and create build for the react app 
COPY package*.json ./
RUN npm install
COPY . ./
