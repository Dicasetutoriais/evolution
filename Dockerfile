FROM node:16.18-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git

WORKDIR /evolution

COPY ./package.json .

ENV DOCKER_ENV=true

ENV SERVER_TYPE="http"
ENV SERVER_PORT=8080

ENV CORS_ORIGIN="*"
ENV CORS_METHODS="POST,GET,PUT,DELETE"
ENV CORS_CREDENTIALS=true

ENV LOG_LEVEL="ERROR,WARN,DEBUG,INFO,LOG,VERBOSE,DARK"
ENV LOG_COLOR=true

ENV DEL_INSTANCE=$DEL_INSTANCE

ENV STORE_CLEANING_INTERVAL=$STORE_CLEANING_INTERVAL
ENV STORE_MESSAGE=$STORE_MESSAGE
ENV STORE_CONTACTS=$STORE_CONTACTS
ENV STORE_CHATS=$STORE_CHATS

ENV DATABASE_ENABLED=$DATABASE_ENABLED
ENV DATABASE_CONNECTION_URI=$DATABASE_CONNECTION_URI
ENV DATABASE_CONNECTION_DB_PREFIX_NAME=$DATABASE_CONNECTION_DB_PREFIX_NAME
ENV DATABASE_SAVE_DATA_INSTANCE=$DATABASE_SAVE_DATA_INSTANCE
ENV DATABASE_SAVE_DATA_OLD_MESSAGE=$DATABASE_SAVE_DATA_OLD_MESSAGE
ENV DATABASE_SAVE_DATA_NEW_MESSAGE=$DATABASE_SAVE_DATA_NEW_MESSAGE
ENV DATABASE_SAVE_MESSAGE_UPDATE=$DATABASE_SAVE_MESSAGE_UPDATE
ENV DATABASE_SAVE_DATA_CONTACTS=$DATABASE_SAVE_DATA_CONTACTS
ENV DATABASE_SAVE_DATA_CHATS=$DATABASE_SAVE_DATA_CHATS

ENV REDIS_ENABLED=$REDIS_ENABLED
ENV REDIS_URI=$REDIS_URI

ENV WEBHOOK_GLOBAL_URL=$WEBHOOK_GLOBAL_URL
ENV WEBHOOK_GLOBAL_ENABLED=$WEBHOOK_GLOBAL_ENABLED
ENV WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=$WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS

ENV WEBHOOK_EVENTS_STATUS_INSTANCE=$WEBHOOK_EVENTS_STATUS_INSTANCE
ENV WEBHOOK_EVENTS_APPLICATION_STARTUP=$WEBHOOK_EVENTS_APPLICATION_STARTUP
ENV WEBHOOK_EVENTS_QRCODE_UPDATED=$WEBHOOK_EVENTS_QRCODE_UPDATED
ENV WEBHOOK_EVENTS_MESSAGES_SET=$WEBHOOK_EVENTS_MESSAGES_SET
ENV WEBHOOK_EVENTS_MESSAGES_UPDATE=$WEBHOOK_EVENTS_MESSAGES_UPDATE
ENV WEBHOOK_EVENTS_MESSAGES_UPSERT=$WEBHOOK_EVENTS_MESSAGES_UPSERT
ENV WEBHOOK_EVENTS_SEND_MESSAGE=$WEBHOOK_EVENTS_SEND_MESSAGE
ENV WEBHOOK_EVENTS_CONTACTS_SET=$WEBHOOK_EVENTS_CONTACTS_SET
ENV WEBHOOK_EVENTS_CONTACTS_UPSERT=$WEBHOOK_EVENTS_CONTACTS_UPSERT
ENV WEBHOOK_EVENTS_CONTACTS_UPDATE=$WEBHOOK_EVENTS_CONTACTS_UPDATE
ENV WEBHOOK_EVENTS_PRESENCE_UPDATE=$WEBHOOK_EVENTS_PRESENCE_UPDATE
ENV WEBHOOK_EVENTS_CHATS_SET=$WEBHOOK_EVENTS_CHATS_SET
ENV WEBHOOK_EVENTS_CHATS_UPSERT=$WEBHOOK_EVENTS_CHATS_UPSERT
ENV WEBHOOK_EVENTS_CHATS_UPDATE=$WEBHOOK_EVENTS_CHATS_UPDATE
ENV WEBHOOK_EVENTS_CONNECTION_UPDATE=$WEBHOOK_EVENTS_CONNECTION_UPDATE
ENV WEBHOOK_EVENTS_GROUPS_UPSERT=$WEBHOOK_EVENTS_GROUPS_UPSERT
ENV WEBHOOK_EVENTS_GROUPS_UPDATE=$WEBHOOK_EVENTS_GROUPS_UPDATE
ENV WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=$WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE

ENV WEBHOOK_EVENTS_NEW_JWT_TOKEN=$WEBHOOK_EVENTS_NEW_JWT_TOKEN

ENV CONFIG_SESSION_PHONE_CLIENT=$CONFIG_SESSION_PHONE_CLIENT
ENV CONFIG_SESSION_PHONE_NAME=Chrome

ENV QRCODE_LIMIT=$QRCODE_LIMIT

# ENV AUTHENTICATION_TYPE="apikey"
ENV AUTHENTICATION_TYPE=$AUTHENTICATION_TYPE

ENV AUTHENTICATION_API_KEY=$AUTHENTICATION_API_KEY

ENV AUTHENTICATION_JWT_EXPIRIN_IN=$AUTHENTICATION_JWT_EXPIRIN_IN
ENV AUTHENTICATION_JWT_SECRET="L=0YWt]b2w[WF>#>:&E`"

ENV AUTHENTICATION_INSTANCE_NAME=$AUTHENTICATION_INSTANCE_NAME
ENV AUTHENTICATION_INSTANCE_WEBHOOK_URL=$AUTHENTICATION_INSTANCE_WEBHOOK_URL
ENV AUTHENTICATION_INSTANCE_MODE=$AUTHENTICATION_INSTANCE_MODE
ENV AUTHENTICATION_INSTANCE_WEBHOOK_BY_EVENTS=$AUTHENTICATION_INSTANCE_WEBHOOK_BY_EVENTS

RUN npm install

COPY . .

RUN npm run build

CMD [ "node", "./dist/src/main.js" ]
