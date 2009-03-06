require_recipe "runit"
include_recipe "logrotate"

template "/etc/chef/client.rb" do
  mode 0644
  source "client.rb.erb"
  action :create
end

directory "/var/log/chef"

logrotate "chef-client" do
  rotate_count 5
  files "/var/log/chef/*.log"
end

execute "Register client node with chef server" do
  command "#{node[:chef][:client_path]} -t #{`cat /etc/chef/validation_token`}"
end

execute "Remove the validation token" do
  command "rm /etc/chef/validation_token"
end

runit_service "chef-client"