FROM caddy:2.6.3-builder-alpine@sha256:9b9c4318103d25a4e563f6aa54e72cf8d5b8ae1a4d12265c48eea9e1d97b8ed0 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:ed81228ba91274f9af97ca5d41dafff1a9f1cfcedb6679377ea577c6540469b8
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
