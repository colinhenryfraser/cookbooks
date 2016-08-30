
#
# Configure
template '/etc/sysconfig/docker' do
  source 'docker_conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  backup false
  variables start_options: Docker_helper.get_start_options(databag_item, node)
  notifies :restart, 'service[docker]', :immediately
end
