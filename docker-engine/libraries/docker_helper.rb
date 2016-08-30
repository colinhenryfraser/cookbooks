module Docker_helper
  
  #
  # Helper function to pull the docker start_options from data bag if it exsits 
  # else return the start_options configured in attributes.
  def self.get_start_options(databag_item, node)
  
    # The host FQDN to use when checking data bags
    fqdn = node['fqdn']

    # set the default from attributes
    default_start_options = node.run_state['docker-engine']['start_options']
    
    begin 
      # Try data bag for the specific host
      return databag_item['docker-engine'][fqdn]['start_options']
    rescue
      # It doesn't matter if it fails, we have other options...
    end

    begin
      # Try data bag for the default
      return databag_item['docker-engine']['default']['start_options']
    rescue
      # It doesn't matter if it fails, we still have other options...
    end

    # Return the default start_options
    return default_start_options
    
  end
end
