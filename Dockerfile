FROM docker:23.0.6

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py-pip coreutils bash \
  && rm -rf /var/cache/apk/* \
  && pip install pyyaml==5.3.1 \
  && pip install -U awscli python-dateutil==2.8.2 \
  && apk --purge -v del py-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
