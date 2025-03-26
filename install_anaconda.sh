#!/bin/bash

# Обновление пакетов
sudo apt update

# Установка зависимостей
sudo apt install -y wget bzip2 curl

# Скачивание установочного скрипта Anaconda
wget -O ~/anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

# Проверка целостности скачанного файла
sha256sum ~/anaconda.sh
# Сравните выведенный хэш с официальным хэшем на сайте Anaconda

# Установка Anaconda
bash ~/anaconda.sh -b -p $HOME/anaconda3

# Добавление Anaconda в PATH
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bashrc

# Применение изменений
source ~/.bashrc

# Удаление установочного скрипта
rm ~/anaconda.sh

# Проверка установки
conda --version
