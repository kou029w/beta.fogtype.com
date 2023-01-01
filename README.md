# β

beta.fogtype.com
: 使い捨て実行環境

## Usage

1. beta.fogtype.com に SSH でアクセス
2. `caddy`、`caddy.reverse_proxy` ラベルを与えて Docker コンテナを実行
   - 例: `--label=caddy=example.beta.fogtype.com --label=caddy.reverse_proxy={{upstreams}}`
3. `caddy` ネットワークにアタッチ

詳しい使い方は [caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy#readme) を参照

## Example

[example/compose.yml](example/compose.yml)

```sh
docker context create --docker=host=ssh://ubuntu@beta.fogtype.com beta
docker context use beta
docker compose --project-directory=example up -d
```

## Setup

```sh
sudo apt install ansible
ansible-playbook setup.yml
```

詳しい構成は [setup.yml](setup.yml) を参照
