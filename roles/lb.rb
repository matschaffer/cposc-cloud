name        "lb"
description "HAProxy load balancer"
run_list    "recipe[apt]",
            "recipe[haproxy::app_lb]"
override_attributes "haproxy" => {
                      "app_server_role" => "app",
                      "member_port" => 8000
                    }
