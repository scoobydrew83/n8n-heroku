FROM n8nio/n8n:latest

# Install required packages globally
RUN npm install -g jsonwebtoken jwks-rsa

# Ensure that Node.js can find globally installed modules.
ENV NODE_PATH=/usr/local/lib/node_modules

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
