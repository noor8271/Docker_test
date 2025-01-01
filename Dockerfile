FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
COPY package.json package.json
COPY package-lock.json package.lock.json
COPY main.js main.js
RUN node -v
RUN npm install
ENTRYPOINT [ "node","main.js" ]