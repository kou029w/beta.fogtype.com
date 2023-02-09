FROM caddy:2.6.3-builder-alpine@sha256:d7e4d9f2654863b0405e051f717f84c9b69c1b97ae73e3fc1cc69064304f579a AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.3-alpine@sha256:e782cdc152609a801ac266b687d8edf04ba03afcc79feab6b893b3cf70e58b25
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
