FROM caddy:2.6.2-builder-alpine@sha256:52bab0eb5e663aa95c55cfbf2387f3f69e427ddb521e6e09336b5c62f3a79681 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.2-alpine@sha256:25a0097607868fb05a89a5ab9fea2f2ea4cecdc89d887d7dcee8c778a21b9e1f
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
