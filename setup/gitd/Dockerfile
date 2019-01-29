FROM winlu/docker-git-server

RUN echo "PubkeyAcceptedKeyTypes=+ssh-dss" >> /etc/ssh/sshd_config
RUN apk add --no-cache lighttpd
ADD lighthttpd.conf /
ADD entrypoint.sh /
ADD git-init /etc/skel/git-shell-commands/init
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
