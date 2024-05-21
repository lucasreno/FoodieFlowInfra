![ff-logo-180](https://github.com/lucasreno/FoodieFlowOrder/assets/62509668/0b815640-6948-4f75-bcf1-03eca61a31d1)
# Foodie Flow Infra

Projeto desenvolvido para entrega do Tech Challenge da Pos Tech - Software Architecture (Fase 4).

## Grupo 102
- Lucas Renó - RM 351351

## Visão Geral
A aplicação é composta por três microserviços que, juntos, formam o Foodie Flow. Além disso, foi criado um projeto específico para gerenciar a infraestrutura.
- [Foodie Flow Order](https://github.com/lucasreno/FoodieFlowOrder): Responsável por gerenciar os pedidos dos usuários
- [Foodie Flow KDS](https://github.com/lucasreno/FoodieFlowKDS): Responsável por disponibilizar os pedidos para a cozinha
- [Foodie Flow Pay](https://github.com/lucasreno/FoodieFlowPay): Responsável por gerenciar os pagamentos dos pedidos
- [Foodie Flow Infra](https://github.com/lucasreno/FoodieFlowInfra): Infraestrutura para os microserviços

## Vídeo de Apresentação
[![Vídeo de Apresentação](https://img.youtube.com/vi/1Q6Q1Q1Q1Q1Q/0.jpg)](https://www.youtube.com/watch?v=1Q6Q1Q1Q1Q1Q)

## Objetivo

Este projeto visa criar uma infraestrutura para os microserviços da aplicação Foodie Flow utilizando Google Cloud Platform.

#### Stack utilizada:
- Terraform
- Github Actions

#### Recursos utilizados:
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
- Execute o workflow desejado
    - `create-cluster-gke`: Cria um cluster no GKE (Google Kubernetes Engine)
    - `create-database`: Cria as instâncias do Cloud SQL e Firestore, além de criar o banco de dados
    - `create-pubsub`: Cria um schema e um tópico no Pub/Sub
