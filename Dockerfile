FROM caddy:2.6.3-builder-alpine@sha256:e6c08f0694b44abd7ae623da15e368a4828a38cae59c041ab8f55c750fc66351 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:77845149bcba28d31f045702daf6dfb1d84e61a1acb6fdfb12d2108f4d91de88
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
