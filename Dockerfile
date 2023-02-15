FROM caddy:2.6.4-builder-alpine@sha256:1c3ef085bd94af6d3fe0e8d5e3f1de0791d8d3e65d5ec39603560ea657a22daa AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:1d39948357ef8ba114c1620c2b5953fa0b4c3f13fec79cb10ccb1c01b2937a3a
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
