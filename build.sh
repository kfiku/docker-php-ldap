#!/usr/bin/env bash

docker build -t kfiku/docker-php-ldap .
docker build -t kfiku/docker-php-ldap:build build

echo done building
