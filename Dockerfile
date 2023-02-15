FROM caddy:2.6.4-builder-alpine@sha256:ef81823d12a3d4befb8d3dc29929c37f003682cc6a9cc8a7e8ed08442fc2644a AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:aacae65cfdcf61777306cf7c131fb968f67bb7fab8dfd683aa073e8b99867e66
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
