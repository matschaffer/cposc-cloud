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

service 'hello_cposc' do
  action [ :enable, :start ]
end
