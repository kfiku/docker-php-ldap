#!/usr/bin/env bash

docker pull php:7-fpm-alpine
docker build -t kfiku/docker-php-ldap .
docker build -t kfiku/docker-php-ldap:build build

echo done building
