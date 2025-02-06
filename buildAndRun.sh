#!/bin/sh
mvn clean package && docker rm -f fitness-shop.dev ||
    docker rm -f fitness-shop-mysql.dev || 
    docker rmi patrickhub/fitness-shop:1.0-SNAPSHOT ||
    true && docker-compose up