# Stage 1: build the site with a pinned Hugo extended image
FROM ghcr.io/gohugoio/hugo:v0.167.0 AS build
USER root
WORKDIR /src
COPY . .
RUN chown -R hugo:hugo /src
USER hugo
RUN hugo --gc --minify --destination /tmp/public

# Stage 2: serve the static output with nginx
FROM nginx:1.29-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /tmp/public /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1
