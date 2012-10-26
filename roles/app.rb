name        "app"
description "Simple Web App"
run_list    "recipe[apt]",
            "recipe[cposc::app]"
