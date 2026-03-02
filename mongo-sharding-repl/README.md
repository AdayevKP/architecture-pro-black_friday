# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Инициализация шардов кластера mongodb

```shell
./scripts/mongo-init.sh
```

Инициализация реплик кластера mongodb

```shell
./scripts/mongo-init-replicas.sh
```


Показать количество записей на шардах

```shell
./scripts/mongo-shards-data.sh
```