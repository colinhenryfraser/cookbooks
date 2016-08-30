
#
# Check how in which mode we are running
include_recipe "kubernetes-master::rpm"

#
# Exec core cookbook logic
include_recipe "kubernetes-master::configure"

#
# If needed, block jmx access
include_recipe "kubernetes-master::start"
