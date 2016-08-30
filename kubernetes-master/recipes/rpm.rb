
#
# Install the RPM
yum_package "kubernetes-master #{Kubernetes_master_helper.get_package_version(node, databag_item())}"

