# my-app

API Express com TypeScript, Prisma ORM e PostgreSQL, containerizada com Docker.

## Pré-requisitos

- [Docker](https://www.docker.com/) instalado e rodando
- [Node.js](https://nodejs.org/) (caso queira rodar fora do Docker)

## Modo desenvolvimento com Docker

### 1. Clone o repositório

```bash
git clone https://github.com/odairmichaelbendotti/my-app.git
cd my-app
```

### 2. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
DATABASE_URL="postgresql://postgres:1234@postgres:5432/postgres?schema=public"
```

> O host `postgres` refere-se ao nome do serviço do banco no docker-compose. Se rodar localmente fora do Docker, troque por `localhost`.

### 3. Construa a imagem

```bash
docker build -t api .
```

### 4. Suba o container

```bash
docker run --name api -p 3000:3000 -v ${PWD}:/app api
```

A aplicação estará disponível em `http://localhost:3000`.

### 5. Rode as migrations do Prisma

Com o container rodando, abra um novo terminal e execute:

```bash
docker exec -it api npx prisma migrate deploy
```

### 6. (Opcional) Abra o Prisma Studio

Interface visual para inspecionar o banco de dados:

```bash
docker exec -it api npx prisma studio
```

Acesse em `http://localhost:5555`.

## Rotas disponíveis

| Método | Rota            | Descrição               |
|--------|-----------------|-------------------------|
| GET    | `/curso-docker` | Retorna mensagem da API |

## Comandos úteis

```bash
# Parar o container
docker stop api

# Remover o container
docker rm api

# Ver logs da aplicação
docker logs -f api

# Regenerar o Prisma Client após alterar o schema
docker exec -it api npx prisma generate

# Criar uma nova migration
docker exec -it api npx prisma migrate dev --name nome_da_migration

# Resetar o banco de dados
docker exec -it api npx prisma migrate reset
```
