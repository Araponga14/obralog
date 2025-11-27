#!/bin/bash
set -e
docker compose pull
docker compose up --build -d
sleep 3
docker compose exec backend npx prisma migrate deploy
docker compose exec backend npx prisma db seed
docker compose logs -f