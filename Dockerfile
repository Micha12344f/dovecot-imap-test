FROM dovecot/dovecot:latest-dev

USER root
RUN echo 'auth_allow_cleartext = yes' > /etc/dovecot/conf.d/99-plaintext-auth.conf
USER vmail