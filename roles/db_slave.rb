name        "db_slave"
description "Redis DB Slave"
run_list    "recipe[cposc::db_slave]",
            "recipe[redisio::install]",
            "recipe[redisio::enable]"
