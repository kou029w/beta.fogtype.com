FROM caddy:2.6.4-builder-alpine@sha256:f7077b6592ce8cbb22b90962292914dbe2284303ea8fe32f5f0c1d6e6fee169e AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:3f4414616d9141c4fbd9f66641d9b91a3b67833dd4145738c536dee584db5314
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
