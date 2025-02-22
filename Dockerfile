FROM n8nio/n8n:latest

USER root

# Create a directory for custom modules.
RUN mkdir -p /data/custom-modules
WORKDIR /data/custom-modules

# Create a minimal package.json with the required dependencies.
RUN echo '{"dependencies": {"jsonwebtoken": "^9.0.0", "jwks-rsa": "^3.0.1"}}' > package.json

# Install the dependencies locally in /data/custom-modules/node_modules.
RUN npm install

# Add the custom modules directory to NODE_PATH so that they can be required in n8n Code nodes.
ENV NODE_PATH=/data/custom-modules/node_modules:/usr/local/lib/node_modules

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
