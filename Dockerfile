FROM caddy:2.6.3-builder-alpine@sha256:95f3c49dc771f40e186dc78efd3f6f4ced0126178dcc2c56199c49389be3cf2e AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:ed81228ba91274f9af97ca5d41dafff1a9f1cfcedb6679377ea577c6540469b8
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
