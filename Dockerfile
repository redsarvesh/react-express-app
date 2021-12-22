FROM alpine

LABEL  Sarvesh Kumar "saursarv@gmail.com"

RUN apk update && apk upgrade && apk add yarn npm  &&  apk add --no-cache bash git

RUN git clone https://github.com/redsarvesh/react-express-app.git

WORKDIR /react-express-app

RUN yarn && yarn build

WORKDIR /react-express-app/frontend

RUN yarn && yarn build

WORKDIR /react-express-app

EXPOSE 8080

CMD ["yarn", "run", "start"]
