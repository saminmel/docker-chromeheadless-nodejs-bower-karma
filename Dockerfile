FROM ubuntu:14.04

RUN apt-get update -qqy \
  && apt-get -qqy install libnss3 libnss3-tools libfontconfig1 wget ca-certificates apt-transport-https inotify-tools unzip \
  libpangocairo-1.0-0 libx11-xcb-dev libxcomposite-dev libxcursor1 libxdamage1 libxi6 libgconf-2-4 libxtst6 libcups2-dev \
  libxss-dev libxrandr-dev libasound2-dev libatk1.0-dev libgtk-3-dev ttf-ancient-fonts chromium-codecs-ffmpeg-extra \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

RUN apt-get update && apt-get install --no-install-recommends -y google-chrome-stable

# nodejs, bower, karma
ENV NODE_VERSION 5.0.0

# RUN apt-get update
# RUN apt-get -qq update
RUN apt-get install xz-utils
RUN wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz

RUN tar -C /usr/local --strip-components 1 -xJf node-v$NODE_VERSION-linux-x64.tar.xz

RUN npm install -g karma-cli

RUN npm install -g gulp

RUN npm install -g bower

RUN apt-get install -y git