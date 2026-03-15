#!/bin/bash

set -e

DIR=$1
SERVICE=$2
BRANCH=$3
REMOTE=$4

if [ -z "$DIR" ] || [ -z "$SERVICE" ] || [ -z "$BRANCH" ] || [ -z "$REMOTE" ]; then
    echo "Uso:"
    echo "deploy-restart.sh <dir> <service> <branch> <remote>"
    exit 1
fi

echo "===================================="
echo "      UPDATE + RESTART START"
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
echo "Reiniciando container"
echo "===================================="

docker compose restart $SERVICE

echo ""
echo "===================================="
echo "Logs iniciais"
echo "===================================="

docker compose logs --tail=40 $SERVICE

echo ""
echo "===================================="
echo "RESTART FINALIZADO"
echo "===================================="
