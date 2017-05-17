FROM node

RUN echo US/Pacific | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN yarn global add gulp-cli

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib

ADD . /usr/src/app
RUN yarn

CMD [ "yarn", "start" ]
