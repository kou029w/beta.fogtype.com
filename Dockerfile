FROM caddy:2.6.4-builder-alpine@sha256:1c3ef085bd94af6d3fe0e8d5e3f1de0791d8d3e65d5ec39603560ea657a22daa AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:aacae65cfdcf61777306cf7c131fb968f67bb7fab8dfd683aa073e8b99867e66
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
