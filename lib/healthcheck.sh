#!/bin/bash

DIR=$1

if [ -z "$DIR" ]; then
    echo "Uso:"
    echo "healthcheck.sh <dir>"
    exit 1
fi

cd "$DIR"

echo "===================================="
echo "Containers em execução"
echo "===================================="

docker compose ps

echo ""
echo "===================================="
echo "Uso de recursos (Memória/CPU)"
echo "===================================="

docker stats --no-stream
