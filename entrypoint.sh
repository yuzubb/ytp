#!/bin/sh

# Renderの$PORT環境変数を使用
PORT=${PORT:-3007}

echo "Starting Nginx proxy on port $PORT"

# nginx.confのポート番号を置換
sed "s/listen 3007;/listen $PORT;/g" /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# 設定をテスト
nginx -t

# Nginxを起動
exec nginx -g "daemon off;"
