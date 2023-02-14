FROM caddy:2.6.3-builder-alpine@sha256:0ea26b79226b45986585e9bb8c4e3fa8f4e2b21a0344cb92e3ff9bfa362750c4 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:ed81228ba91274f9af97ca5d41dafff1a9f1cfcedb6679377ea577c6540469b8
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
