#!/bin/bash

# Função para criar a imagem Docker
criar_imagem_docker() {
  local ambiente=$1
  
  echo "Criando imagem do Nébula ZAP"

  IMAGE_TAG="nebulasistemas/nebula-zap-api:$ambiente"

  echo "docker tag aldinokemal2104/go-whatsapp-web-multidevice:latest $IMAGE_TAG"
  docker tag  aldinokemal2104/go-whatsapp-web-multidevice:latest $IMAGE_TAG

  echo "docker login -u nebulasistemas"
  docker login -u nebulasistemas --password 0457bc93-4e0f-4786-a1e6-1cad45a44a0d

  echo "docker push $IMAGE_TAG"
  docker push $IMAGE_TAG

  echo "docker rmi $IMAGE_TAG"
  docker rmi -f $IMAGE_TAG
}

# Função para exibir a mensagem de uso do script
usage() {
  echo "Uso: $0 <ambiente>"
  echo "Exemplo: $0 dev"
  exit 1
}

# Valida os argumentos
if [ $# -ne 1 ]; then
  usage
fi

AMBIENTE=$1

# Início do script
echo "Iniciando o projeto no ambiente: $AMBIENTE"

echo "docker-compose up -d --build"
docker-compose up -d --build

# Chamar a função quando necessário
criar_imagem_docker "$AMBIENTE"

#echo "docker-compose down"
#docker-compose down

echo "Processo concluído no ambiente: $AMBIENTE"
