#!/bin/bash

docker build -t fedora-wsl -f Containerfile .
docker create --name fedora-wsl-container fedora-wsl
docker export fedora-wsl-container -o fedora-wsl.tar
docker rm fedora-wsl-container
wsl --unregister fedora
wsl --import fedora-wsl /mnt/c/Users/morri/fedora fedora-wsl.tar --version 2