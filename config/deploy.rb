set :application, 'whoami'
set :repo_url, 'git@github.com:thomascate/whoami.git'
set :deploy_to, '/var/www/whoami'
set :deploy_via, :copy
set :use_sudo, false
set :rbenv_ruby, '2.0.0-p353'
set :rbenv_custom_path, '/opt/rbenv'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5

namespace :deploy do
  SECONDS_APART = 20

  desc 'Restart application'
  task :restart do
  end

  after :finishing, 'deploy:cleanup'
end

