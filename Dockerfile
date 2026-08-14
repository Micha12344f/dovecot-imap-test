FROM dovecot/dovecot:latest-dev

USER root
RUN echo 'auth_allow_cleartext = yes' > /etc/dovecot/conf.d/99-plaintext-auth.conf

# Create a custom entrypoint script that fixes volume permissions then starts dovecot as vmail
RUN printf '#!/bin/sh\nchown -R vmail:vmail /srv/vmail 2>/dev/null\nexec su vmail -s /bin/sh -c "exec /dovecot/sbin/dovecot -F"\n' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]