FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "[BASE-OK] meshwrite baseline build"; id'
ENTRYPOINT ["/bin/sh","-c"]
