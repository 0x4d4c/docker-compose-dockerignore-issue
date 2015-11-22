#!/bin/bash
set -eu

echo "[*] Building images for the first time."
docker-compose build
docker build -t composecache testcase

echo -e "\n[*] Changing some file."
date > testcase/src/somefile

echo -e "\n[*] Rebuilding with compose."
docker-compose build

echo -e "\n[*] Rebuilding with docker build."
docker build -t composecache testcase

echo -e "\n[*] Adding Dockerfile to .dockerignore."
echo Dockerfile > testcase/.dockerignore

echo -e "\n[*] Rebuilding with compose."
docker-compose build

echo -e "\n[*] Rebuilding with docker build."
docker build -t composecache testcase

echo -e "\n[*] Changing some file."
date > testcase/src/somefile

echo -e "\n[*] Rebuilding with compose."
docker-compose build

echo -e "\n[*] Rebuilding with docker build."
docker build -t composecache testcase

echo > testcase/.dockerignore

