#!/bin/bash
echo "Criando imagem do NS-ZAP"

echo "docker-compose up -d --build"
docker-compose up -d --build

echo "docker tag  aldinokemal2104/go-whatsapp-web-multidevice:latest nebulasistemas/nebula-zap-api:hml"
docker tag  aldinokemal2104/go-whatsapp-web-multidevice:latest nebulasistemas/nebula-zap-api:hml

echo "docker authentication  nebulasistemas/nebula-zap-api:hml"
docker login -u nebulasistemas --password 0457bc93-4e0f-4786-a1e6-1cad45a44a0d #-p Docker2021*

echo "docker push  nebulasistemas/nebula-zap-api:hml"
docker push nebulasistemas/nebula-zap-api:hml

#echo "docker remove  nebulasistemas/nebula-zap-api:hml"
#docker rmi nebulasistemas/nebula-zap-api:hml

echo "Finalizado em"
date