FROM caddy:2.6.2-builder-alpine@sha256:1c3cc909f35abc55bedd55d1050e7ec632a0168cb6436a04bfe23dd84b8b3f67 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.2-alpine@sha256:25a0097607868fb05a89a5ab9fea2f2ea4cecdc89d887d7dcee8c778a21b9e1f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
