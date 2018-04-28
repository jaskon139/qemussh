FROM gotechnies/alpine-ssh
RUN apk update
RUN apk add qemu-system-x86_64
RUN wget https://cloud-images.ubuntu.com/xenial/20180420/xenial-server-cloudimg-amd64-disk1.img
