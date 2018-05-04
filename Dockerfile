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

RUN sed -ie 's/#Port 22/Port 12222/g' /etc/ssh/sshd_config

# Install nginx
RUN apk add --update nginx 
RUN mkdir -p /run/nginx/

EXPOSE 80
CMD /usr/sbin/nginx && /root/ssh_and_ss/entrypoint4.sh && /usr/local/bin/chisel server --socks5
