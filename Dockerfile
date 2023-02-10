FROM caddy:2.6.3-builder-alpine@sha256:e6c08f0694b44abd7ae623da15e368a4828a38cae59c041ab8f55c750fc66351 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:7e7286bb77df853f278887dd9159bd643abca8447ad4a0fddb4c48ec00a7e6cc
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
