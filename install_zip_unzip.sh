#!/bin/bash

# Обновление списка пакетов
sudo apt update

# Установка zip и unzip
sudo apt install -y zip unzip

# Проверка установки
zip -v
unzip -v
