# 
# This data can be overridden in the data bag - see readme

# Package version
default["kubernetes"]["master"]["package_version"] = "> 1"

# config
default["kubernetes"]["master"]["conf"]["config"]["KUBE_ETCD_SERVERS"] = "--etcd_servers=http://localhost:4001"
default["kubernetes"]["master"]["conf"]["config"]["KUBE_LOGTOSTDERR"] = "--logtostderr=true"
default["kubernetes"]["master"]["conf"]["config"]["KUBE_LOG_LEVEL"] = "--v=0"
default["kubernetes"]["master"]["conf"]["config"]["KUBE_ALLOW_PRIV"] = "--allow_privileged=false"

# apiserver
default["kubernetes"]["master"]["conf"]["apiserver"]["KUBE_API_ADDRESS"] = "--address=0.0.0.0"
default["kubernetes"]["master"]["conf"]["apiserver"]["KUBE_API_PORT"] = "--port=8080"
default["kubernetes"]["master"]["conf"]["apiserver"]["KUBE_MASTER"] = "--master=http://#{node['fqdn']}:8080"
default["kubernetes"]["master"]["conf"]["apiserver"]["KUBELET_PORT"] = "--kubelet_port=10250"
default["kubernetes"]["master"]["conf"]["apiserver"]["KUBE_SERVICE_ADDRESSES"] = "--service-cluster-ip-range=172.254.0.0/16"

# controller
#default["kubernetes"]["master"]["conf"]["controller"][""] = ""

# scheduler
#default["kubernetes"]["master"]["conf"]["scheduler"][""] = ""