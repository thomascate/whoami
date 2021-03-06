set :stage, :staging
set :branch, :master
set :ssh_options, { :forward_agent => true, :StrictHostKeyChecking => false, :keys => ["/root/.ssh/id_rsa"] }
set :repo_url, 'https://github.com/thomascate/whoami'

server '127.0.0.1', user: 'deploy', roles: 'app'
