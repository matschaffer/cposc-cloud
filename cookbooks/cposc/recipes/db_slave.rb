master = search("node", "role:db AND chef_environment:#{node.chef_environment}").first

node['redisio']['servers'] = [
  { 'port' => '6379',
    'slaveof' => {
      'address' => master['hostname'],
      'port'    => master['redisio']['servers'].first['port']
    }
  }
]
