FROM alpine:3.18

# Устанавливаем curl для тестов
RUN apk add --no-cache curl

# Создаем пользователя appuser (UID 1001)
RUN adduser -D -u 1001 appuser

# Создаем отдельную рабочую директорию для веб-сервера и даем на нее права пользователю
RUN mkdir -p /app && chown -R appuser:appuser /app

# Переключаемся на безопасного пользователя
USER appuser

# Создаем тестовый файл с данными, который мы будем запрашивать
RUN echo "Hello from safe Docker container!" > /app/index.html

# Запускаем веб-сервер, указав в качестве домашней директории безопасную папку /app
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/app"]
