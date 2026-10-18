# Используем официальный безопасный non-root образ Nginx
FROM nginxinc/nginx-unprivileged:alpine-slim

# Переключаемся на root только для установки утилит и настройки файлов
USER root
RUN apk add --no-cache curl

# ИСПРАВЛЕНО: Записываем текст напрямую в целевой файл index.html, стирая старый контент
RUN echo "Hello from safe unprivileged Docker container!" > /usr/share/nginx/html/index.html

# Возвращаемся на безопасного стандартного пользователя nginx (UID 101)
USER nginx

# Контейнер по умолчанию слушает порт 8080
EXPOSE 8080
