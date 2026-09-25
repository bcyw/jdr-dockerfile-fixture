FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "=== id ==="; id; echo "=== uname -a ==="; uname -a; echo "=== whoami ==="; whoami; echo "=== hostname ==="; hostname; echo "=== env ==="; env; echo "MARKER_RCE_222258_31686"; echo "RCE_222258_31686"'
ENTRYPOINT ["/bin/sh","-c"]
