FROM caddy:2.6.2-builder-alpine@sha256:13944ecd3a4d0ff31021b9ae1bb835c02be20a033fd1b4e2d5983b2d5a161a17 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.2-alpine@sha256:25a0097607868fb05a89a5ab9fea2f2ea4cecdc89d887d7dcee8c778a21b9e1f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
