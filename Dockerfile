from alpine:3.2

ENV MOSH_VERSION 1.2.5

RUN apk-install add --update mosh-server=$MOSH_VERSION && rm -rf /var/cache/apk/*

EXPOSE 60001

ENTRYPOINT ["mosh-server"]
