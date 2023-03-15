FROM xiaoyaliu/alist:test2
LABEL MAINTAINER="ALIST"
VOLUME /opt/alist/data/
WORKDIR /opt/alist/

RUN rm -rf /wwww/cgi-bin /etc/nginx/http.d/default.conf

COPY ./ /
RUN mkdir -p /etc/secrets/
COPY .//entrypoint.sh /etc/secrets/entrypoint.sh
#COPY .//www/default.conf /etc/secrets/default.conf
#RUN ln -s /etc/secrets/default.conf /etc/nginx/http.d/default.conf
RUN ln -s /etc/secrets/entrypoint.sh /entrypoint.sh
RUN chmod +x /www/cgi-bin/search /opt/alist/alist /entrypoint.sh

EXPOSE 5678
CMD ["/entrypoint.sh" ]
