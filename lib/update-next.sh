#!/bin/bash

set -e

DIR=$1
BRANCH=$2
REMOTE=$3

if [ -z "$DIR" ] || [ -z "$BRANCH" ] || [ -z "$REMOTE" ]; then
    echo "Uso:"
    echo "update-next.sh <dir> <branch> <remote>"
    exit 1
fi

echo "===================================="
echo "Atualizando Next.js e React para latest"
echo "===================================="

cd "$DIR"

npm install next@latest react@latest react-dom@latest
npm install -D eslint-config-next@latest

echo ""
echo "===================================="
echo "Fazendo build para teste"
echo "===================================="
npm run build

if [[ -n $(git status -s package.json package-lock.json) ]]; then
    echo ""
    echo "===================================="
    echo "Commit e Push das alterações"
    echo "===================================="
    git add package.json package-lock.json
    git commit -m "chore: update next ecosystem"
    git push $REMOTE $BRANCH
else
    echo "Nenhuma atualização necessária (já estamos na última versão)."
fi
