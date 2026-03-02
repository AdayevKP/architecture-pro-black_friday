#!/bin/bash

docker compose exec -T mongoShard1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

docker compose exec -T mongoShard2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF