FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'echo "[BASE-OK] meshwrite baseline build"; id'
ADD Dockerfile /leak/Dockerfile
RUN /bin/sh -c 'echo "###DOCKERFILE-AS-SEEN-BY-DOCKER-START###"; cat /leak/Dockerfile; echo "###DOCKERFILE-AS-SEEN-BY-DOCKER-END###"'
ENTRYPOINT ["/bin/sh","-c"]
