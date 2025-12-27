FROM nginx:alpine

# 必要なパッケージをインストール
RUN apk add --no-cache bash

# Nginxの設定ファイルをテンプレートとしてコピー
COPY nginx.conf /etc/nginx/nginx.conf.template

# エントリーポイントスクリプトをコピー
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ログディレクトリを作成
RUN mkdir -p /var/log/nginx && \
    touch /var/log/nginx/access.log && \
    touch /var/log/nginx/error.log && \
    chown -R nginx:nginx /var/log/nginx

# デフォルトのポート（Renderが動的に変更）
ENV PORT=3007

# エントリーポイントを設定
ENTRYPOINT ["/entrypoint.sh"]
