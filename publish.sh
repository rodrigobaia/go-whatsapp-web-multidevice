#!/bin/bash

# Verifica se o argumento foi passado
if [ -z "$1" ]; then
    echo "Uso: $0 <Ambiente>"
    exit 1
fi

AMBIENTE=$1

# Limpa o console
clear
echo -e "\e[32mCriando imagem Docker para com o serviço do whatsapp para envio e recebimento de mensagem\e[0m"

docker-compose up -d --build

# Define a tag da imagem
IMAGE_TAG="nebulasistemas/nebula-zap-api:$AMBIENTE"
IMAGE_ZAP_TAG="go-whatsapp-web-multidevice-whatsapp_go:latest"

# Início do script
echo -e "\e[36mIniciando o build no ambiente:[$AMBIENTE]\e[0m"

# Comandos Docker
echo -e "\e[37mdocker build -t $IMAGE_TAG .\e[0m"
docker tag "$IMAGE_ZAP_TAG" "$IMAGE_TAG"

echo -e "\e[37mdocker login -u nebulasistemas\e[0m"
docker login -u nebulasistemas --password "0457bc93-4e0f-4786-a1e6-1cad45a44a0d"

echo -e "\e[37mdocker push $IMAGE_TAG\e[0m"
docker push "$IMAGE_TAG"

echo -e "\e[37mdocker rmi $IMAGE_TAG\e[0m"
docker rmi "$IMAGE_TAG"

echo -e "\e[32mProcesso concluído!\e[0m"
