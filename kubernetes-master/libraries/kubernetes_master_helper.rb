module Kubernetes_master_helper

	# 
	# Configuration will be pulled from attributes and 
	# data bags (data bags will take preference).
	# Return the config for /etc/kubernetes/<conf_type>
	# conf_type should be one of "config", "apiserver", "controller", "scheduler"
	def self.get_config(conf_type, databag_item, node)

		# the hash to return
		config = {}
		fqdn = node['fqdn']

		#
		# Check for config in attributes and merge
		begin
			config.merge!(node["kubernetes"]["master"]["conf"][conf_type])
		rescue
			# Don't worry if it fails
		end

		# Check in data bag default (will override previous)
		begin
			config.merge!(databag_item["kubernetes-master"]["default"]["conf"][conf_type])
		rescue
			# Don't worry if it fails
		end

		# check in data bag node specific (will override previous)
		begin
			config.merge!(databag_item["kubernetes-master"][fqdn]["conf"][conf_type])
		rescue
			# Don't worry if it fails
		end

		# Return the final config hash
		return config
	end

	#
	# Pull the package version required from data bags if it exists.
	# If it doesn't exist use the version in the attributes
	def self.get_package_version(node, databag_item)
		
		fqdn = node['fqdn']

		# Try data bag with fqdn settings
		begin
			version = databag_item["kubernetes-master"][fqdn]["package_version"]
			return version
		rescue
		end

		# Try data bag with default settings
		begin
			version = databag_item["kubernetes-master"]["default"]["package_version"]
			return version
		rescue
		end

		# Try attributes
		return node["kubernetes"]["master"]["package_version"]

	end

end