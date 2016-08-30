
#
# Start the docker service
service 'docker' do
  action [:enable, :start]
end

