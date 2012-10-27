name        "db"
description "Redis DB"
run_list    "recipe[apt]",
            "recipe[redisio::install]",
            "recipe[redisio::enable]"
