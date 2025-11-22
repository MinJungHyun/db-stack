#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

case "$1" in
  rdb)
    docker compose -f docker-compose.rdb.yml down
    ;;
  nosql)
    docker compose -f docker-compose.nosql.yml down
    ;;
  vector)
    docker compose -f docker-compose.vector.yml down
    ;;
  n8n)
    docker compose -f docker-compose.n8n.yml down
    ;;
  all|"")
    docker compose -f docker-compose.n8n.yml down || true
    docker compose -f docker-compose.vector.yml down || true
    docker compose -f docker-compose.nosql.yml down || true
    docker compose -f docker-compose.rdb.yml down || true
    ;;
  *)
    echo "사용법: $0 [rdb|nosql|vector|n8n|all]"
    exit 1
    ;;
esac

echo "🛑 종료 완료"
