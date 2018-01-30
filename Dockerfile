FROM fluent/fluentd:v0.12-onbuild
MAINTAINER yunlzheng <yunlzheng@gmail.com>

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # cutomize following instruction as you wish
 && sudo gem install \
        fluent-plugin-secure-forward \
        fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

ADD fluent.conf /fluentd/etc/

EXPOSE 24284
