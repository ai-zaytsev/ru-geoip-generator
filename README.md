# 📌 RU GeoIP Generator

Этот репозиторий автоматически обновляет базу данных GeoIP и предоставляет актуальный `geoip.dat` для загрузки.

## 📅 Обновления
Файл **обновляется каждый четверг**.

📥 **Скачать последнюю версию:**  
[**geoip.dat (latest)**](https://github.com/ai-zaytsev/ru-geoip-generator/releases/download/latest/geoip.dat)

## 🔧 Как работает?
- **GitHub Actions** автоматически скачивает свежие данные GeoLite2.
- Файл `geoip.dat` генерируется и загружается в **GitHub Releases**.
- Пользователи могут скачать файл по ссылке `/releases/latest/download/geoip.dat`.

## 🛠 Использование
Скачайте файл `geoip.dat` в свою систему:
```bash
wget https://github.com/ai-zaytsev/ru-geoip-generator/releases/download/latest/geoip.dat
