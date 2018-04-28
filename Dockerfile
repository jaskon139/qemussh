FROM gotechnies/alpine-ssh
RUN apk update
RUN apk add qemu-system-x86_64
RUN git clone https://github.com/jaskon139/ssh_and_ss.git
CMD ["cd /root/ssh_and_ss && chmod +x ./entrypoint3.sh && sudo ./entrypoint3.sh"," "]
