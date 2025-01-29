# 📌 RU GeoIP Generator

Этот репозиторий автоматически обновляет базу данных **российских IP-адресов** в формате `geoip.dat`, предназначенную для использования в **Rules для Xray**.

## 📅 Обновления
Файл **обновляется каждый четверг**.

📥 **Скачать последнюю версию:**  
[**geoip.dat (latest)**](https://github.com/ai-zaytsev/ru-geoip-generator/releases/download/latest/geoip.dat)

## 🔧 Как работает?
- **GitHub Actions** автоматически скачивает свежие данные GeoLite2.
- Файл `geoip.dat` фильтруется для выделения **российских IP-адресов**.
- Полученный `geoip.dat` загружается в **GitHub Releases**.
- Пользователи могут скачать файл по ссылке `/releases/latest/download/geoip.dat`.

## 🛠 Использование с Xray
Добавьте правило в конфигурацию Xray (`config.json`), чтобы **направлять российский трафик через определённый прокси или напрямую**:

```json
{
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": ["geoip:ru"],
        "outboundTag": "direct"
      }
    ]
  }
}
```

## 🛠 Скачивание
Скачайте файл `geoip.dat` в свою систему:
```bash
wget https://github.com/ai-zaytsev/ru-geoip-generator/releases/download/latest/geoip.dat
```
