FROM n8nio/n8n:latest

USER root

# Install build tools (e.g. for node-gyp, if needed)
RUN apk add --update --no-cache python3 make g++

# Navigate to the n8n installation directory and install your modules
RUN cd /usr/local/lib/node_modules/n8n && npm install --unsafe-perm jsonwebtoken jwks-rsa

# If needed, set environment variables to allow external modules in Code nodes
# (you should also set these in Heroku Config Vars for runtime as well)
ENV NODE_FUNCTION_ALLOW_EXTERNAL=jsonwebtoken,jwks-rsa

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
