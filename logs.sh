#!/bin/bash

STACK_NAME="sentry"

# Função para seguir logs em tempo real
follow_logs() {
    SERVICE=$1
    docker service logs -f --tail 10 $SERVICE
}

# Listar todos os serviços na stack e iterar sobre eles
for SERVICE in $(docker stack services --format "{{.Name}}" $STACK_NAME); do
    echo "Abrindo logs para o serviço: $SERVICE"
    follow_logs $SERVICE
done

# Manter o script em execução para permitir que os subprocessos sigam os logs
wait

# sentry_nginx "POST /api/2/envelope/ HTTP/1.1" 403 86 "-" "sentry.php.laravel/4.7.0" "-"
# sentry_relay ERROR relay_server::services::health_check: Health check probe 'auth' failed
