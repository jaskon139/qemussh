# qemussh

FROM jaskon139/ccssshh


EXPOSE 9999/UDP 3824/UDP 22/tcp

COPY other/identity.* /root/data/net/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data/net
RUN chmod 777 -R /root
COPY kcptunserver /root/data/

CMD /usr/local/bin/entrypoint.sh