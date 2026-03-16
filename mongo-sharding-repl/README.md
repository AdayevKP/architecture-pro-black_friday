# pymongo-api

## Как запустить

Перейти в директорию [mongo-sharding-repl](./mongo-sharding-repl)

```shell
cd mongo-sharding-repl
```

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Инициализация кластера mongodb c репликами

```shell
./scripts/mongo-init-replicas.sh
```

Если запуск скрипта выдает ошибку 
```MongoNetworkError: connect ECONNREFUSED 127.0.0.1:27020```
то надо подождать 30 секунд и запустить снова

Заполнение данных в mongodb

```shell
./scripts/mongo-init.sh
```

Показать количество записей на шардах

```shell
./scripts/mongo-shards-data.sh
```