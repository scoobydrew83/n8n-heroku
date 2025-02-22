FROM n8nio/n8n:latest

USER root

# Change directory to n8n’s installation directory and install the packages.
RUN cd /usr/local/lib/node_modules/n8n && npm install --unsafe-perm jsonwebtoken jwks-rsa

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
