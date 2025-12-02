#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

case "$1" in
  mysql)
    docker compose -f docker-compose.mysql.yml down
    ;;
  postgresql|postgres)
    docker compose -f docker-compose.postgresql.yml down
    ;;
  redis)
    docker compose -f docker-compose.redis.yml down
    ;;
  qdrant)
    docker compose -f docker-compose.qdrant.yml down
    ;;
  minio)
    docker compose -f docker-compose.minio.yml down
    ;;
  n8n)
    docker compose -f docker-compose.n8n.yml down
    ;;
  all|"")
    docker compose -f docker-compose.n8n.yml down || true
    docker compose -f docker-compose.minio.yml down || true
    # docker compose -f docker-compose.qdrant.yml down || true
    # docker compose -f docker-compose.redis.yml down || true
    docker compose -f docker-compose.postgresql.yml down || true
    docker compose -f docker-compose.mysql.yml down || true
    ;;
  *)
    echo "사용법: $0 [mysql|postgresql|redis|qdrant|minio|n8n|all]"
    exit 1
    ;;
esac

echo "🛑 종료 완료"
