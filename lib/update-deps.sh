#!/bin/bash

set -e

DIR=$1
BRANCH=$2
REMOTE=$3

if [ -z "$DIR" ] || [ -z "$BRANCH" ] || [ -z "$REMOTE" ]; then
    echo "Uso:"
    echo "update-deps.sh <dir> <branch> <remote>"
    exit 1
fi

echo "===================================="
echo "Atualizando dependências no package.json"
echo "===================================="

cd "$DIR"

npx npm-check-updates -u

echo ""
echo "===================================="
echo "Instalando pacotes"
echo "===================================="
npm install

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
    git commit -m "chore: update dependencies"
    git push $REMOTE $BRANCH
else
    echo "Nenhuma atualização necessária nos pacotes."
fi
