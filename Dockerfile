# Используем официальный безопасный non-root образ Nginx
FROM nginxinc/nginx-unprivileged:alpine-slim

# Переключаемся на root только для установки curl внутри образа (для соответствия вашей специфике)
USER root
RUN apk add --no-cache curl

# Возвращаемся на безопасного стандартного пользователя nginx (UID 101)
USER nginx

# Создаем тестовую страницу с данными
RUN echo "Hello from safe unprivileged Docker container!" > /tmp/index.html && \
    cp /tmp/index.html /usr/share/nginx/html/index.html

# Контейнер по умолчанию слушает порт 8080
EXPOSE 8080
