FROM debian:stretch-slim

RUN apt-get update \
 && apt-get install -y gnupg2 curl \
 && apt-key adv --keyserver keys.gnupg.net --recv-keys 9E3E53F19C7DE460 \
 && echo "deb http://repo.aptly.info/ squeeze main" | tee /etc/apt/sources.list.d/aptly.list \
 && apt-get update \
 && apt-get install -y aptly=1.2.0 \
 && rm -rf /var/lib/apt/lists/*

RUN curl -LsS "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/sbin/gosu \
 && chmod +x /usr/sbin/gosu \
 && groupadd -g 999 aptly \
 && useradd -g aptly -u 999 -d /repo aptly

VOLUME /repo

COPY entrypoint.sh /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["aptly"]
