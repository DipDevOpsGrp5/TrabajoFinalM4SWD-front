# The first instruction is what image we want to base our container on
# We Use an official node alpine image
FROM node:16-alpine

# create destination directory
ENV PROJECT_ROOT /usr/src/mod4-front
RUN mkdir -p $PROJECT_ROOT
WORKDIR $PROJECT_ROOT

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git python3 make g++

# Install app dependencies
COPY package.json $PROJECT_ROOT
COPY yarn.lock $PROJECT_ROOT
RUN yarn install

# Bundle app source
COPY . $PROJECT_ROOT

EXPOSE 3000
CMD ["yarn", "serve", "--port", "3000"]
