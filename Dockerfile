FROM var2dan/docker-chisel-ssh

RUN apk update \
	&& apk add qemu-system-x86_64 git

WORKDIR /root

RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/jaskon139/ssh_and_ss.git
RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/buildkit-io/bktty.git

RUN cat /root/ssh_and_ss/mikimg/* >> /root/ssh_and_ss/mikimg/fedora.img 
RUN cat /root/ssh_and_ss/tc/* >> /root/ssh_and_ss/tc/tinycore.img 
RUN cat /root/ssh_and_ss/ow/* >> /root/ssh_and_ss/ow/ow.img 

RUN chmod +x /root/ssh_and_ss/entrypoint4.sh

EXPOSE 22 8080
CMD /usr/sbin/sshd  && /root/ssh_and_ss/entrypoint4.sh && /usr/local/bin/chisel server --socks5
