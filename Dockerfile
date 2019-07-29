FROM ruby:2.5-alpine

RUN apk update && apk --no-cache add \
    openssh \
    rsync &&\
    gem install chef \
    chake

WORKDIR /chef

ENTRYPOINT ["/usr/local/bin/rake"]

CMD ["converge"]
