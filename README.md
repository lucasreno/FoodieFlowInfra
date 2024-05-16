# Foodie Flow Infra

Projeto desenvolvido para entrega do Tech Challenge da Pos Tech - Software Architecture (Fase 4).

## Objetivo

O objetivo deste projeto é criar uma infraestrutura para a aplicação Foodie Flow usando Google Cloud Platform. 
Stack utilizada:
- Terraform
- Github Actions
Recursos utilizados:
- Google Kubernetes Engine
- Google Cloud SQL
- Google Firestore
- Google Pub/Sub

## Funcionamento
![infra](https://github.com/lucasreno/FoodieFlowInfra/assets/62509668/7c38cada-664a-4c45-a5c0-d3b0f7cdce47)


## Pré-requisitos
- Conta no Google Cloud Platform
- Familiaridade com Terraform
- Familiaridade com conceitos de kubernetes
- Conhecimento básico do Github Actions

## Passo a passo

### 1. Preparar uma autenticação no GCP
- Acesse o IAM e administrador > Contas de serviço
- Crie uma nova conta de serviço com as permissões necessárias para criar recursos citados acima
- Após a criação, clique na conta de serviço e vá para aba de chaves
- Crie uma nova chave e salve o arquivo json

### 2. Defina as variáveis secretas no Github
- Acesse o repositório do Github
- Vá para a aba de configurações
- Vá para a aba de secrets
- Adicione as seguintes variáveis:
    - Secrets:
        - `GCP_CREDENTIALS`: Conteúdo do arquivo json criado no 1º passo
        - `GCP_PROJECT_ID`: ID do projeto no GCP
        - `GCP_REGION`: Região onde os recursos serão criados
        - `DB_PASSWORD`: Senha banco de dados
    - Variables:
        - `ENVIRONMENT`: Variável que define ambiente (prod/qa)

### 3. Execute o workflow no Github Actions
- Acesse a aba de Actions
- Execute o workflow "Terraform GKE Workflow"
