FROM caddy:2.6.3-builder-alpine@sha256:d3cea84ce21b4d7cf7d619f3b9eda7af041830e2bdd41e4b7ca4eab0929450c6 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:68f6a805085516b3f7585ceb97bb835b8cb7e9ad57548b40decfe5398e685e30
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
