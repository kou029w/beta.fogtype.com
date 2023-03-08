FROM caddy:2.6.4-builder-alpine@sha256:6a6200d6f94d3e2f715b2066b22dbcb49e9598feab6c86bbb40cde3200644a76 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:3f4414616d9141c4fbd9f66641d9b91a3b67833dd4145738c536dee584db5314
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
