#!/usr/bin/env bash
set -e

# 항상 이 스크립트가 있는 폴더 기준으로 실행
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR"

case "$1" in
  mysql)
    echo "▶ MySQL만 올립니다..."
    docker compose -f docker-compose.mysql.yml up -d
    ;;
  postgresql|postgres)
    echo "▶ PostgreSQL만 올립니다..."
    docker compose -f docker-compose.postgresql.yml up -d
    ;;
  redis)
    echo "▶ Redis만 올립니다..."
    docker compose -f docker-compose.redis.yml up -d
    ;;
  qdrant)
    echo "▶ Qdrant만 올립니다..."
    docker compose -f docker-compose.qdrant.yml up -d
    ;;
  minio)
    echo "▶ MinIO만 올립니다..."
    docker compose -f docker-compose.minio.yml up -d
    ;;
  n8n)
    echo "▶ n8n (with PostgreSQL)만 올립니다..."
    docker compose -f docker-compose.n8n.yml up -d
    ;;
  all|"")
    echo "▶ MySQL + PostgreSQL + MinIO + n8n 전체 올립니다..."
    docker compose -f docker-compose.mysql.yml up -d
    docker compose -f docker-compose.postgresql.yml up -d
    # docker compose -f docker-compose.redis.yml up -d
    # docker compose -f docker-compose.qdrant.yml up -d
    docker compose -f docker-compose.minio.yml up -d
    docker compose -f docker-compose.n8n.yml up -d
    ;;
  *)
    echo "사용법: $0 [mysql|postgresql|redis|qdrant|minio|n8n|all]"
    exit 1
    ;;
esac

echo "✅ 완료"
