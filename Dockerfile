FROM jaskon139/ssh_and_ss
RUN cd /root
RUN git clone https://github.com/jaskon139/ssh_and_ss.git
CMD cd /root/ssh_and_ss && chmod +x ./entrypoint3.sh && sudo ./entrypoint3.sh
