FROM caddy:2.6.4-builder-alpine@sha256:6a6200d6f94d3e2f715b2066b22dbcb49e9598feab6c86bbb40cde3200644a76 AS builder
RUN xcaddy build --with github.com/lucaslorentz/caddy-docker-proxy/v2
FROM caddy:2.6.4-alpine@sha256:5c484a4a330983be3377bc7f78ec04e168e1cc48ad1ece215e301a47672471f7
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy", "--ingress-networks=caddy"]
