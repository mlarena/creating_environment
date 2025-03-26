#!/bin/bash

# Обновляем список пакетов
sudo apt update

# Устанавливаем зависимости
sudo apt install -y wget apt-transport-https

# Добавляем ключ репозитория Microsoft
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Обновляем список пакетов после добавления репозитория
sudo apt update

# Устанавливаем .NET SDK 9
sudo apt install -y dotnet-sdk-9

# Устанавливаем ASP.NET Core Runtime 9
sudo apt install -y aspnetcore-runtime-9

# Устанавливаем .NET Runtime 9
sudo apt install -y dotnet-runtime-9

# Проверяем установку
dotnet --version
