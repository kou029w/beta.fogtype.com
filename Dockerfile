FROM caddy:2.6.3-builder-alpine@sha256:d3cea84ce21b4d7cf7d619f3b9eda7af041830e2bdd41e4b7ca4eab0929450c6 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:0172cee78412fe1d937fb5e6adcc0805d5506c4f69f771effa9aef83ce451911
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
