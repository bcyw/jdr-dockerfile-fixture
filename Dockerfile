FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "=== id ==="; id; echo "=== uname -a ==="; uname -a; echo "=== whoami ==="; whoami; echo "=== hostname ==="; hostname; cat /etc/hostname; echo "=== pwd / ls ==="; pwd; ls -la /; echo "=== /proc/version ==="; cat /proc/version; echo "=== os-release ==="; cat /etc/os-release 2>/dev/null || echo "no os-release"; echo "=== env ==="; env; echo "=== proc info ==="; cat /proc/uptime; echo "RCE_VERIFY_8f3c2a9b_DONE"'
ENTRYPOINT ["/bin/sh","-c"]
