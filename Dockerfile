FROM jaskon139/ssh_and_ss
COPY * /root/
CMD cd /root/ssh_and_ss && ./entrypoint3.sh
