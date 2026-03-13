#!/bin/bash

set -e

DIR=$1
SERVICE=$2
BRANCH=$3
REMOTE=$4

if [ -z "$DIR" ] || [ -z "$SERVICE" ] || [ -z "$BRANCH" ] || [ -z "$REMOTE" ]; then
    echo "Uso:"
    echo "deploy-full.sh <dir> <service> <branch> <remote>"
    exit 1
fi

echo "===================================="
echo "        DEPLOY FULL START"
echo "===================================="

echo "Projeto: $DIR"
echo "Serviço: $SERVICE"
echo "Branch: $BRANCH"
echo "Remote: $REMOTE"

echo ""

cd "$DIR"

echo "===================================="
echo "Atualizando código"
echo "===================================="

git fetch $REMOTE $BRANCH
git reset --hard $REMOTE/$BRANCH

echo ""
echo "===================================="
echo "Build do container"
echo "===================================="

docker compose build --no-cache $SERVICE

echo ""
echo "===================================="
echo "Subindo container"
echo "===================================="

docker compose up -d $SERVICE

echo ""
echo "===================================="
echo "Limpando imagens antigas"
echo "===================================="

docker image prune -f

echo ""
echo "===================================="
echo "Logs iniciais"
echo "===================================="

docker compose logs --tail=40 $SERVICE

echo ""
echo "===================================="
echo "DEPLOY FINALIZADO"
echo "===================================="