#
# The Kubernetes Master Services
services = ['kube-apiserver', 'kube-controller-manager', 'kube-scheduler']

services.each do |srv|
	service srv do
  		action [ :enable, :start ]
	end
end

