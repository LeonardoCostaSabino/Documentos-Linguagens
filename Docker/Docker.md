# Docker

>Docker ele é nativo de linux e compartilham o Kernel e o host da maquina

# Vantagem

>O docker não necessita de Sistema Operacional para executar comandos diferente da Virtual Machine que tem como fator obrigatório do uso de um sistema operacional.

Verificar a versão do docker, ou seja ver se ele está instalado no seu sistema

```docker
docker --version
```

Informa ao usuário mais detalhes sobre a instalação que foi executada

```docker
docker info
```

Construir o ambiente para o desenvolvimento

```Docker
docker build -t=[NAME]
```

```Docker
docker run -p [ROTA]:80 [NAME]
```

Modo de detecção dentro dos containers (LS)

```Docker
docker run -d -p [ROTA]:80 [NAME]
```

Parar a execução de um container

```Docker
docker container stop [ID]
```

Baixar uma imagem pronta da internet

```Docker
docker tag [IMAGE] [USERNAME]/[NAME OF REPOSITORY]
```

Fazer um Upload de um container

```Docker
docker push [USERNAME]/[NAME OF REPOSITORY]
```

## Conceito

>Plataforma onde ficaram os aplicativos similar a nuvem em que são instanciados as aplicações e são moldaveis com facilidade e portateis por possuirem um tamanho muito pequeno

## Container

>Local onde ficaram as Imagens,eles ficaram instanciados em memória enquanto são executados

Para visualizar os containers em execução!

```Docker
docker ps
```

## Imagens

>os arquivos de configuração, programas e APIs que são necessárias para executar seus programas.

Testando uma imagem no Docker

```Docker
docker run hello-world
```

Mostrar imagems que existem dentro da maquina

```Docker
docker image ls
```

Mostrar imagems que existem dentro da maquina (Em Execução,Todos,Mostra só ID das imagens. Respectivamente)

```Docker
docker image ls
docker image ls --all
docker image ls -aq
```

**Parei na parte de Containers**


Mostrar imagems que existem dentro da maquina

```Docker
docker image ls
```

Comando para levantar um docker do PC

```shell
sabino@BSMAQ000045593 ~/Desktop/avaliacao [master]
± % docker-compose up              
```
## DockerFile

>Define como será seu ambiente de desenvolvimento, podendo acessar interfaces online e drivers virtualizados de maneira isolada

>O arquivo somente é escrito como *Dockerfile* sem extensão


Exemplos de DockerFile

> Python

```Docker
# Imagem oficial da python
FROM python:2.7-slim

# Salvando os arquivos na pasta app
WORKDIR /app

# Copia o direitório atual para a pasta /app
COPY . /app

# Instala todos os pacotes necessários esecificados no arquivo requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Gera o caminho Web para Localhost:80
EXPOSE 80

# Define o nome do Ambiente de desenvolvimento
ENV NAME World

# Executa o arquivo app.py quando iniciar o container
CMD ["python", "app.py"]
```

>Para instalar qualquer tipo de dependencia como nesse exemplo o requirements.txt e o app.py devem estar na mesma para em que está o arquivo DockerFile

## Serviços

>Nome do arquivo será *docker-compose.yml*

Iniciar o swarm dentro do container

```Docker
docker swarm init
```

Verificar os serviços em Execução

```Docker
docker service ls
```
