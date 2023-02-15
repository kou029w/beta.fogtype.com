FROM caddy:2.6.3-builder-alpine@sha256:c0390bd15c9ea9ac5fa29d2b6c5e7549e83688ff51460ed59c0c39881f903b17 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:ed81228ba91274f9af97ca5d41dafff1a9f1cfcedb6679377ea577c6540469b8
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
