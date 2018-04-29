FROM jaskon139/ssh_and_ss
RUN apt-get update
RUN apt-get install -y qemu
RUN cd ~ && wget https://cloud-images.ubuntu.com/xenial/20180420/xenial-server-cloudimg-amd64-disk1.img
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data/net
RUN chmod 777 -R /root
RUN apt-get install bzr
RUN bzr branch lp:~smoser/+junk/backdoor-image
RUN sh backdoor-image --user ubuntu --password ubuntu --password-auth ~/ubuntu-12.04-server-cloudimg-amd64-disk1.img
EXPOSE 9999/UDP 3824/UDP 
CMD /usr/local/bin/entrypoint.sh
