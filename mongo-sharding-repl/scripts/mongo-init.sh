#!/bin/bash

docker compose exec -T mongoConfigSrv mongosh --port 27017 <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "mongoConfigSrv:27017" }
    ]
  }
);
> exit(); 
EOF

docker compose exec -T mongoShard1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "mongoShard1",
      members: [
        { _id : 0, host : "mongoShard1:27018" },
      ]
    }
);
EOF

docker compose exec -T mongoShard2 mongosh --port 27019 <<EOF
rs.initiate(
    {
      _id : "mongoShard2",
      members: [
        { _id : 1, host : "mongoShard2:27019" }
      ]
    }
  );
EOF

docker compose exec -T mongodb1 mongosh --port 27020 <<EOF
sh.addShard( "mongoShard1/mongoShard1:27018");
sh.addShard( "mongoShard2/mongoShard2:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
EOF
