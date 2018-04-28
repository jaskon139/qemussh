FROM gotechnies/alpine-ssh
RUN apk update
RUN apk add qemu-system-x86_64
