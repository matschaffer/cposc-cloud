package 'nodejs'
package 'git'

template "/etc/init/hello_cposc.conf" do
  source "upstart.conf.erb"
  variables root: '/opt/hello_cposc'
end

service 'hello_cposc' do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true
  action :nothing
end

git '/opt/hello_cposc' do
  repository 'https://github.com/matschaffer/hello_cposc.git'
  reference 'master'
  notifies :restart, "service[hello_cposc]"
end

db_servers = search("node", "role:db AND chef_environment:#{node.chef_environment}") || []
db_server = db_servers.first

if db_server
  redis_config = { host: db_server['hostname'],
                   port: db_server['redisio']['servers'].first['port'] }

  file '/opt/hello_cposc/config/production.json' do
    content({redis: redis_config}.to_json)
    notifies :restart, "service[hello_cposc]"
  end
end

service 'hello_cposc' do
  action [ :enable, :start ]
end
