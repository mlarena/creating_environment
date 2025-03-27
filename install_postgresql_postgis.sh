#!/bin/bash

# Установка необходимых пакетов для добавления репозитория
sudo apt install -y gnupg gnupg2 gnupg1

# Добавление репозитория PostgreSQL
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Импорт ключа GPG для репозитория PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Обновление списка пакетов после добавления репозитория
sudo apt update

# Установка последней версии PostgreSQL и PostGIS
sudo apt install -y postgresql postgresql-contrib postgis

# Запуск PostgreSQL сервиса
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Настройка пароля для пользователя postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'toor';"

# Создание базы данных для PostGIS
sudo -u postgres createdb -E UTF8 template_postgis

# Установка расширения PostGIS в базе данных template_postgis
sudo -u postgres psql -d template_postgis -c "CREATE EXTENSION postgis;"

# Проверка установки PostgreSQL
psql_version=$(psql --version | head -n 1)
echo "Установленная версия PostgreSQL: $psql_version"

# Проверка установки PostGIS
postgis_version=$(sudo -u postgres psql -d template_postgis -tA -c "SELECT postgis_full_version();")
echo "Версия PostGIS: $postgis_version"
