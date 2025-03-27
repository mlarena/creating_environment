#!/bin/bash

# Функция для проверки наличия блокировки
check_lock() {
    if lsof /var/lib/dpkg/lock-frontend >/dev/null 2>&1; then
        echo "Файл блокировки используется другим процессом. Пожалуйста, подождите и повторите попытку позже."
        exit 1
    fi
}

# Проверяем наличие блокировки перед началом установки
check_lock

# Добавляем репозиторий dotnet
sudo add-apt-repository -y ppa:dotnet/backports
if [ $? -ne 0 ]; then
    echo "Ошибка при добавлении репозитория dotnet"
    exit 1
fi

# Обновляем список пакетов
sudo apt-get update
if [ $? -ne 0 ]; then
    echo "Ошибка при обновлении списка пакетов"
    exit 1
fi

# Устанавливаем .NET SDK 9.0
sudo apt-get install -y dotnet-sdk-9.0
if [ $? -ne 0 ]; then
    echo "Ошибка при установке .NET SDK 9.0"
    exit 1
fi

# Устанавливаем ASP.NET Core Runtime 9.0
sudo apt-get install -y aspnetcore-runtime-9.0
if [ $? -ne 0 ]; then
    echo "Ошибка при установке ASP.NET Core Runtime 9.0"
    exit 1
fi

# Устанавливаем .NET Runtime 9.0
sudo apt-get install -y dotnet-runtime-9.0
if [ $? -ne 0 ]; then
    echo "Ошибка при установке .NET Runtime 9.0"
    exit 1
fi

# Выводим версию установленного .NET SDK
dotnet --version

echo "Установка завершена!"
