#!/bin/bash

# Создание окружения для общей разработки приложений
conda create -n general_dev_env python=3.10

# Активация окружения
source activate general_dev_env

# Установка общих пакетов для разработки
conda install -y numpy pandas matplotlib scipy scikit-learn jupyter

# Установка дополнительных пакетов (по необходимости)
conda install -y flask requests

# Деактивация окружения
conda deactivate

echo "Окружение general_dev_env создано и настроено."
