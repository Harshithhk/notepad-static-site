# Start with the Ubuntu base image
FROM caddy:latest

# Create directory for static files
RUN mkdir -p /srv

# Copy static files to the container
COPY index.html /srv/index.html

# Expose Caddy's default HTTP port
EXPOSE 8080

# Copy Caddyfile to the container
COPY Caddyfile /etc/caddy/Caddyfile

# Start Caddy server
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
