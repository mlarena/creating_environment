#!/bin/bash

# Обновление списка пакетов
sudo apt update

# Установка зависимостей
sudo apt install -y wget apt-transport-https

# Добавление ключа репозитория Microsoft GPG
wget https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# Добавление репозитория .NET
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/$(lsb_release -rs)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnet.list'

# Обновление списка пакетов с новым репозиторием
sudo apt update

# Установка .NET SDK 9
sudo apt install -y dotnet-sdk-9

# Установка ASP.NET Core Runtime 9
sudo apt install -y aspnetcore-runtime-9

# Установка .NET Runtime 9
sudo apt install -y dotnet-runtime-9

# Проверка установки
dotnet --version
