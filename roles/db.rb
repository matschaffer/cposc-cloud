name        "db"
description "Redis DB"
run_list    "recipe[redisio::install]",
            "recipe[redisio::enable]"
