FROM dovecot/dovecot:latest-root

RUN echo 'disable_plaintext_auth = no' > /etc/dovecot/conf.d/99-plaintext-auth.conf