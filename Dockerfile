FROM jaskon139/ssh_and_ss

USER root

COPY identity.* /root/data/net/

# using exec format so that /sbin/init is proc 1 (see procd docs)
CMD /usr/local/bin/entrypoint.sh
