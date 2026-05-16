FROM nginx:alpine

# Copy app files
COPY app/ /usr/share/nginx/html/

# Custom nginx config for SPA
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
    gzip on; \
    gzip_types text/html text/css application/javascript; \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
