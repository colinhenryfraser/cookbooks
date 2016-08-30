# prerequisites
include_recipe 'docker-engine::prerequisites'

# Install
include_recipe 'docker-engine::rpm'

# Configure
include_recipe 'docker-engine::configure'

# Start
include_recipe 'docker-engine::start'
