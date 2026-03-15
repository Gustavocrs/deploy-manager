#!/bin/bash

DIR=$1
SERVICE=$2

if [ -z "$DIR" ] || [ -z "$SERVICE" ]; then
    echo "Uso:"
    echo "logs.sh <dir> <service>"
    exit 1
fi

cd "$DIR"

echo "===================================="
echo "Acompanhando logs de: $SERVICE"
echo "===================================="

docker compose logs -f --tail=50 $SERVICE
