FROM nginx:1.23.4-alpine

MAINTAINER Subrahmanyam Raparti "rv.subrahmanyam1@gmail.com"

RUN apk --no-cache add python3 py3-pip && pip3 install j2cli[yaml]

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN rm -rf /usr/share/nginx/html/*

COPY /dist /usr/share/nginx/html

COPY nginx.conf.j2 /templates/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
