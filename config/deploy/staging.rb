set :stage, :staging
set :branch, :master
set :ssh_options, { :forward_agent => true }

#register_nodes("name:worker-st-01", ["app"])
server '162.242.241.189', user: 'deploy', roles: 'app'
