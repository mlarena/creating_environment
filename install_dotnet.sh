#!/bin/bash

# Добавляем репозиторий dotnet
sudo add-apt-repository ppa:dotnet/backports

# Обновляем список пакетов
sudo apt-get update

# Устанавливаем .NET SDK 9.0
sudo apt-get install -y dotnet-sdk-9.0

# Обновляем список пакетов
sudo apt-get update

# Устанавливаем ASP.NET Core Runtime 9.0
sudo apt-get install -y aspnetcore-runtime-9.0

# Устанавливаем .NET Runtime 9.0
sudo apt-get install -y dotnet-runtime-9.0

# Выводим версию установленного .NET SDK
dotnet --version

echo "Установка завершена!"
