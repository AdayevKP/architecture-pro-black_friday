#!/bin/bash

docker compose exec -T mongoConfigSrv mongosh --port 27017 <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "mongoConfigSrv:27017" },
      { _id : 1, host : "mongoConfigSrvReplica1:27025" },
      { _id : 2, host : "mongoConfigSrvReplica2:27026" }
    ]
  }
);
exit(); 
EOF

docker compose exec -T mongoShard1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "mongoShard1",
      members: [
        { _id : 0, host : "mongoShard1:27018" },
        { _id : 1, host : "mongoShard1Replica1:27021" },
        { _id : 2, host : "mongoShard1Replica2:27022" }
      ]
    }
);
EOF

docker compose exec -T mongoShard2 mongosh --port 27019 <<EOF
rs.initiate(
    {
      _id : "mongoShard2",
      members: [
        { _id : 0, host : "mongoShard2:27019" },
        { _id : 1, host : "mongoShard2Replica1:27023" },
        { _id : 2, host : "mongoShard2Replica2:27024" }
      ]
    }
);
EOF