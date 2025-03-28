#!/bin/bash

# Создание окружения для разработки YOLO решений
conda create -n yolo_dev_env python=3.10

# Активация окружения
source activate yolo_dev_env

# Установка пакетов для YOLO
conda install -y numpy pandas matplotlib scipy scikit-learn jupyter
conda install -y opencv-python-headless

# Установка YOLOv5 (или другой версии YOLO, если требуется)
pip install torch torchvision torchaudio
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
pip install -r requirements.txt

# Деактивация окружения
conda deactivate

echo "Окружение yolo_dev_env создано и настроено."
