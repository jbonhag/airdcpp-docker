FROM alpine:latest

ADD https://web-builds.airdcpp.net/stable/airdcpp_2.6.1_webui-2.6.1_64-bit_portable.tar.gz /tmp
RUN adduser -D -h /opt/airdcpp-webclient airdcpp \
  && tar -C /opt -xvf /tmp/airdcpp_2.6.1_webui-2.6.1_64-bit_portable.tar.gz \
  && mkdir -p /opt/airdcpp-webclient/config \
  && chown airdcpp:airdcpp /opt/airdcpp-webclient/config

COPY WebServer.xml /opt/airdcpp-webclient/config/WebServer.xml

EXPOSE 5600
USER airdcpp
CMD ["/opt/airdcpp-webclient/airdcppd"]
