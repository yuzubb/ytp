FROM nginx:alpine

# 必要なパッケージをインストール
RUN apk add --no-cache bash

# Nginxの設定ファイルをコピー
COPY nginx.conf /etc/nginx/nginx.conf

# ログディレクトリを作成
RUN mkdir -p /var/log/nginx && \
    touch /var/log/nginx/access.log && \
    touch /var/log/nginx/error.log && \
    chown -R nginx:nginx /var/log/nginx

# Railwayはポート3000をデフォルトで期待
EXPOSE 3000

# Nginxを起動
CMD ["nginx", "-g", "daemon off;"]
