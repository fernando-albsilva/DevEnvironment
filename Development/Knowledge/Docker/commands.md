## Informações e ajuda

```bash
# Verificar a instalação e a versão
docker --version
docker version

# Exibir informações do Docker Engine
docker info

# Consultar a ajuda geral ou de um comando
docker --help
docker run --help
```

## Imagens

```bash
# Listar imagens locais
docker image ls

# Baixar uma imagem do Docker Hub
docker pull nginx:latest

# Remover uma imagem
docker image rm nginx:latest

# Criar uma imagem usando um Dockerfile
docker build -t minha-aplicacao:1.0 .

# Marcar uma imagem para envio ao registry
docker tag minha-aplicacao:1.0 usuario/minha-aplicacao:1.0

# Enviar uma imagem para um registry
docker push usuario/minha-aplicacao:1.0
```

## Containers

```bash
# Criar e executar um container em segundo plano
docker run -d --name meu-nginx -p 8080:80 nginx

# Criar um container interativo
docker run --rm -it ubuntu bash

# Listar containers em execução
docker ps

# Listar todos os containers
docker ps -a

# Exibir os logs de um container
docker logs meu-nginx

# Acompanhar os logs em tempo real
docker logs -f meu-nginx

# Executar um comando dentro de um container em execução
docker exec -it meu-nginx bash

# Parar e iniciar um container
docker stop meu-nginx
docker start meu-nginx

# Reiniciar um container
docker restart meu-nginx

# Remover um container parado
docker rm meu-nginx

# Parar e remover um container
docker rm -f meu-nginx
```

## Volumes e cópia de arquivos

```bash
# Listar volumes
docker volume ls

# Criar um volume nomeado
docker volume create dados-app

# Montar um volume em um container
docker run -d --name banco -v dados-app:/var/lib/postgresql/data postgres

# Copiar um arquivo do host para o container
docker cp arquivo.txt meu-nginx:/tmp/arquivo.txt

# Copiar um arquivo do container para o host
docker cp meu-nginx:/etc/nginx/nginx.conf ./nginx.conf

# Remover um volume
docker volume rm dados-app
```

## Redes

```bash
# Listar redes
docker network ls

# Criar uma rede
docker network create rede-app

# Executar um container conectado à rede
docker run -d --name api --network rede-app minha-api:1.0

# Conectar um container a uma rede existente
docker network connect rede-app meu-nginx

# Remover uma rede
docker network rm rede-app
```

## Docker Compose

Execute os comandos na pasta que contém o arquivo `compose.yaml` ou `docker-compose.yml`.

```bash
# Iniciar os serviços em segundo plano
docker compose up -d

# Construir as imagens e iniciar os serviços
docker compose up -d --build

# Listar os serviços e containers do projeto
docker compose ps

# Exibir os logs dos serviços
docker compose logs -f

# Executar um comando em um serviço
docker compose exec nome-do-servico bash

# Parar os serviços
docker compose stop

# Parar e remover containers e redes do projeto
docker compose down

# Parar e remover também os volumes do projeto
docker compose down -v
```

## Limpeza

```bash
# Exibir o espaço usado pelo Docker
docker system df

# Remover containers parados
docker container prune

# Remover imagens não utilizadas
docker image prune

# Remover recursos não utilizados
# Solicita confirmação antes de executar
docker system prune
```