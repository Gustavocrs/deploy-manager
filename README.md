# Deploy Manager CLI

**Deploy Manager** é uma ferramenta de linha de comando (CLI) leve e eficiente projetada para automatizar o gerenciamento, deploy e manutenção de aplicações Dockerizadas e projetos baseados em Node.js/Next.js.

## 📋 Funcionalidades

- **Deploy Completo**: Atualização de código (git fetch/reset), rebuild limpo de containers e limpeza de imagens antigas.
- **Fast Restart**: Atualização rápida (git pull) seguida de reinício do serviço Docker.
- **Manutenção Automatizada**:
  - Atualização automática de dependências NPM (`npm-check-updates`).
  - Atualização específica para o ecossistema Next.js e React.
  - Commit e push automático das atualizações de versão.
- **Monitoramento**: Visualização rápida de logs e healthcheck (status de containers e uso de recursos).
- **Multi-projetos**: Suporte a múltiplos repositórios configurados centralmente.

## 🚀 Instalação

Recomenda-se a instalação no diretório `/opt` para uso como ferramenta do sistema.

### 1. Preparar o Diretório

Copie os arquivos do projeto para o diretório de destino:

```bash
sudo mkdir -p /opt/deploy-manager
sudo cp -r . /opt/deploy-manager/
```

### 2. Configurar Permissões

Garanta que os scripts tenham permissão de execução:

```bash
cd /opt/deploy-manager
sudo chmod +x deploy.sh
sudo chmod +x lib/*.sh
```

### 3. Criar Atalho Global

Crie um link simbólico para executar o comando `deploy` de qualquer lugar:

```bash
sudo ln -s /opt/deploy-manager/deploy.sh /usr/local/bin/deploy
```

## ⚙️ Configuração

Crie o arquivo de configuração `config/projects.conf` baseando-se no exemplo fornecido.

```bash
cp config/projects.example.conf config/projects.conf
```

### Formato do `projects.conf`

O arquivo utiliza o caractere `|` como separador. Cada linha representa um projeto:

```text
NOME_DO_PROJETO|CAMINHO_ABSOLUTO|SERVICO_DOCKER|BRANCH|REMOTE
```

**Exemplo:**

```text
Meu Site|/home/user/projetos/meu-site|app_site|main|origin
API Backend|/home/user/projetos/minha-api|api_backend|develop|origin
```

## 💻 Uso

Basta digitar `deploy` no terminal:

```bash
deploy
```

Um menu interativo será exibido permitindo selecionar o projeto e a ação desejada (Deploy, Logs, Atualizações, etc).
