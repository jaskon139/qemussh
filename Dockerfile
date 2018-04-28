FROM gotechnies/alpine-ssh
RUN apk update
RUN apk add qemu-system-x86_64
RUN wget https://cloud-images.ubuntu.com/xenial/20180420/xenial-server-cloudimg-amd64-disk1.img
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data/net
RUN chmod 777 -R /root
COPY kcptunserver /root/data/
RUN apk add bzr
RUN bzr branch lp:~smoser/+junk/backdoor-image
RUN sh backdoor-image --user ubuntu --password ubuntu --password-auth ubuntu-12.04-server-cloudimg-amd64-disk1.img
CMD /usr/local/bin/entrypoint.sh
