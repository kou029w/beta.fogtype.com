FROM caddy:2.6.4-builder-alpine@sha256:efaac7e3182771d9b8f67af7b275c649d7590d87e6339f35a1f747181d2fc9d5 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:8b47a88bd36bc9fe75bff823017438cb43d94abe13f638363517e5feeb45a7c6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
