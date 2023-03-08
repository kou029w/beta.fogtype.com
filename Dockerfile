FROM caddy:2.6.4-builder-alpine@sha256:efaac7e3182771d9b8f67af7b275c649d7590d87e6339f35a1f747181d2fc9d5 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:3f4414616d9141c4fbd9f66641d9b91a3b67833dd4145738c536dee584db5314
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
