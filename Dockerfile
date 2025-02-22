FROM n8nio/n8n:latest

USER root

# Install required packages globally with unsafe-perm to avoid permission issues.
RUN npm install --unsafe-perm -g jsonwebtoken jwks-rsa

# Set NODE_PATH to include globally installed modules.
ENV NODE_PATH=/usr/local/lib/node_modules

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
