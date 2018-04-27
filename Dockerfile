FROM jaskon139/ssh_and_ss
RUN cd /root && git clone https://github.com/jaskon139/ssh_and_ss.git
CMD cd /root/ssh_and_ss && ./entrypoint3.sh
