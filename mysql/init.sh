#!/usr/bin/env bash
set -e

# 현재 스크립트 위치 기준으로 프로젝트 루트 이동
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"

# 1️⃣ .env 로드
set -a
source .env
set +a

# 2️⃣ init.sql 생성 (env 치환)
cat > mysql/init.sql <<SQL
-- auto generated
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
SQL

# 3️⃣ docker-compose 실행
docker compose -f docker-compose.mysql.yml up -d

echo "✅ MySQL init complete"
