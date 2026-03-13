# ESTRUTURA
.
├── config
│   └── projects.conf
├── deploy
└── lib
    ├── deploy-full.sh
    ├── deploy-restart.sh
    ├── healthcheck.sh
    ├── logs.sh
    ├── update-deps.sh
    └── update-next.sh

# PREPARAR PASTA
- Criar a pasta no /opt: sudo mkdir /opt/deploy-manager
- Mover os arquivos para a pasta: mv deploy-manager /opt/

# PERMISSÕES
- Permissões de execução: chmod +x /opt/deploy-manager/deploy
- Permissões nos demais scripts: chmod +x /opt/deploy-manager/lib/*.sh

# DEFININDO O COMANDO GLOBAL
- sudo ln -s /opt/deploy-manager/deploy /usr/local/bin/deploy




