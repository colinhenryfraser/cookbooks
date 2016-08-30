
#
# Create User & Group
group 'kube'
user 'kube' do
  action :create
  comment 'Kubernetes User'
  gid 'kube'
  home '/'
  shell '/sbin/nologin'
end

# 
# Config directory
directory '/etc/kubernetes' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# 
# Main config
template '/etc/kubernetes/config' do
  source 'config.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :kube_config_param => Kubernetes_master_helper.get_config("config", databag_item, node)
  notifies :restart, 'service[kube-apiserver]'
  notifies :restart, 'service[kube-controller-manager]'
  notifies :restart, 'service[kube-scheduler]'
end

# 
# kube-apiserver config
template '/etc/kubernetes/apiserver' do
  source 'apiserver.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :kube_apiserver_param => Kubernetes_master_helper.get_config("apiserver", databag_item, node)
  notifies :restart, 'service[kube-apiserver]'
end

# 
# kube-controller config
template '/etc/kubernetes/controller' do
  source 'controller.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :kube_controller_param => Kubernetes_master_helper.get_config("controller", databag_item, node)
  notifies :restart, 'service[kube-controller-manager]'
end

# 
# kube-scheduler config
template '/etc/kubernetes/scheduler' do
  source 'scheduler.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables :kube_scheduler_param => Kubernetes_master_helper.get_config("scheduler", databag_item, node)
  notifies :restart, 'service[kube-scheduler]'
end

