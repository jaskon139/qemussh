FROM var2dan/docker-chisel-ssh

RUN apk update \
	&& apk add qemu-system-x86_64 git

WORKDIR /root

RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/jaskon139/ssh_and_ss.git

COPY * /root/
RUN chmod +x /root/entrypoint4.sh

EXPOSE 22 8080
CMD /usr/sbin/sshd  && /usr/local/bin/chisel server && /root/entrypoint4.sh
