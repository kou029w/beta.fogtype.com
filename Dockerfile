FROM caddy:2.6.4-builder-alpine@sha256:deec5cdeb94dac2c690a1196350e06ddf969c7b552bd397bab206f31ade0d168 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:8b47a88bd36bc9fe75bff823017438cb43d94abe13f638363517e5feeb45a7c6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
