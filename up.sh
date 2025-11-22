#!/usr/bin/env bash
set -e

# 항상 이 스크립트가 있는 폴더 기준으로 실행
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

case "$1" in
  rdb)
    echo "▶ RDB(MySQL)만 올립니다..."
    docker compose -f docker-compose.rdb.yml up -d
    ;;
  nosql)
    echo "▶ NoSQL(Redis)만 올립니다..."
    docker compose -f docker-compose.nosql.yml up -d
    ;;
  vector)
    echo "▶ Vector DB(Qdrant)만 올립니다..."
    docker compose -f docker-compose.vector.yml up -d
    ;;
  n8n)
    echo "▶ n8n만 올립니다..."
    docker compose -f docker-compose.n8n.yml up -d
    ;;
  all|"")
    echo "▶ RDB + NoSQL + Vector + n8n 전체 올립니다..."
    docker compose -f docker-compose.rdb.yml up -d
    docker compose -f docker-compose.nosql.yml up -d
    docker compose -f docker-compose.vector.yml up -d
    docker compose -f docker-compose.n8n.yml up -d
    ;;
  *)
    echo "사용법: $0 [rdb|nosql|vector|n8n|all]"
    exit 1
    ;;
esac

echo "✅ 완료"
