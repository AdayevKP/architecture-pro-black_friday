# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Инициализация кластера mongodb

```shell
./scripts/mongo-init.sh
```

Заполнение данных в mongodb

```shell
./scripts/mongo-fill-data.sh
```

Показать количество записей на шардах

```shell
./scripts/mongo-shards-data.sh
```