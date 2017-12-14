FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

ENV WEBDAV_DATA_DIR=/var/data

USER 0
RUN mkdir -p $WEBDAV_DATA_DIR \
  && chmod -R a+rwx $WEBDAV_DATA_DIR \
  && chown -R 1001:0 $WEBDAV_DATA_DIR \
  && rm -rf /run/httpd \
  && mkdir /run/httpd \
  && chmod -R a+rwx /run/httpd

USER 1001

ADD dav.conf /etc/httpd/conf/

CMD ["/usr/bin/run-httpd", "-f", "/etc/httpd/conf/dav.conf"]
