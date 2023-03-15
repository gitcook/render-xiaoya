FROM xiaoyaliu/alist:test2
CMD ["/bin/sh"]
RUN /bin/sh -c set -ex   && apk add --update --no-cache      sqlite unzip bash curl gzip ripgrep busybox-extras nginx   && rm -rf /tmp/* /var/cache/apk/* # buildkit
RUN /bin/sh -c mv /usr/bin/rg /bin/grep # buildkit
WORKDIR /opt/alist/
VOLUME [/opt/alist/data/]
COPY /app/bin/alist ./ # buildkit
COPY data.zip /var/lib/data.zip # buildkit
COPY docker-entrypoint.sh /entrypoint.sh # buildkit
COPY updateall /updateall # buildkit
RUN /bin/sh -c echo `date` > /docker.version # buildkit
WORKDIR /opt/alist/
VOLUME [/opt/alist/data/]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/alist/alist" "server" "--no-prefix"]
