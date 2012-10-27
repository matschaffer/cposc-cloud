include_recipe 'nginx'

directory "/var/www/nginx-default" do
  recursive true
end

cookbook_file "/var/www/nginx-default/index.html" do
  mode "0644"
end
