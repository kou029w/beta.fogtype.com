FROM caddy:2.6.3-builder-alpine@sha256:e6c08f0694b44abd7ae623da15e368a4828a38cae59c041ab8f55c750fc66351 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:0172cee78412fe1d937fb5e6adcc0805d5506c4f69f771effa9aef83ce451911
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
