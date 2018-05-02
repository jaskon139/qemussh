FROM grugnog/go-http-tunnel

RUN apk update \
	&& apk add qemu-system-x86_64 git

WORKDIR /root

RUN rm -fr /root/ssh_and_ss && GIT_SSL_NO_VERIFY=true git clone https://github.com/jaskon139/ssh_and_ss.git

COPY * /root/

# default variables
ENV COUNTY "US"
ENV STATE "New Jersey"
ENV LOCATION "Piscataway"
ENV ORGANISATION "Ecample"
ENV ROOT_CN "Root"
ENV ISSUER_CN "Example Ltd"
ENV PUBLIC_CN "example.com"
ENV ROOT_NAME "root"
ENV ISSUER_NAME "example"
ENV PUBLIC_NAME "public"
ENV RSA_KEY_NUMBITS "2048"
ENV DAYS "365"

ENTRYPOINT [ "/entrypoint.sh" ]
