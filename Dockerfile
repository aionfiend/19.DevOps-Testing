# Используем легковесный образ Alpine
FROM alpine:3.18

# Устанавливаем curl (он понадобится для внутренних тестов)
RUN apk add --no-cache curl

# Создаем безопасного пользователя (не root) с UID 1001
RUN adduser -D -u 1001 appuser

# Переключаемся на созданного пользователя
USER appuser

# ИСПРАВЛЕНО: Вызываем httpd напрямую через busybox, который точно есть в системе
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/etc"]
