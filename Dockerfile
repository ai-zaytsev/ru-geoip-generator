FROM golang:1.23-alpine

# Устанавливаем необходимые утилиты
RUN apk add --no-cache git curl unzip

# Клонируем репозиторий v2fly/geoip
RUN git clone https://github.com/v2fly/geoip.git /geoip

# Копируем файл конфигурации
COPY config.json /geoip/config.json

# Создаём папку для базы GeoLite2
RUN mkdir -p /geoip/geolite2

# Копируем файлы GeoLite2 в контейнер (если они уже есть на сервере)
COPY GeoLite2-Country-CSV.zip /geoip/geolite2/

# Распаковываем GeoLite2 в контейнере
RUN unzip -o /geoip/geolite2/GeoLite2-Country-CSV.zip -d /geoip/geolite2 && \
    mv /geoip/geolite2/GeoLite2-Country-CSV_*/* /geoip/geolite2/ && \
    rmdir /geoip/geolite2/GeoLite2-Country-CSV_*

# Указываем рабочую директорию
WORKDIR /geoip

# Проверяем, что go.mod существует
RUN ls -lh go.mod

# Загружаем зависимости
RUN go mod tidy
RUN go mod download

# Компилируем geoip
RUN go build -o geoip

# Указываем команду по умолчанию
CMD ["./geoip", "-c", "config.json"]
