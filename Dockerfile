FROM caddy:2.6.3-builder-alpine@sha256:a11383c5bae9aa6cf9d3d9b8ff2936ab4ffdadb84133c1899254d0c5458ae9e0 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:68f6a805085516b3f7585ceb97bb835b8cb7e9ad57548b40decfe5398e685e30
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
