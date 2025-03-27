#!/bin/bash

# Обновление списка пакетов
sudo apt update

# Установка PostgreSQL и PostGIS
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
psql --version

# Проверка установки PostGIS
psql -d template_postgis -c "SELECT postgis_full_version();"
