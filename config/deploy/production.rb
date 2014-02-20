set :application, 'whoami'
set :repo_url, 'git@github.com:AutomationSupport/1824145-whoami.git'
set :deploy_to, '/var/www/whoami'
set :deploy_via, :remote_cache
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
    #on roles(:scheduler), in: :parallel do |host|
    #  info "Restarting scheduler process on #{host}"
    #  execute "sudo monit -g resque_scheduler restart all"
    #end
    #
    ## Restart the EM push workers
    #on roles(:sidekiq), in: :parallel do |host|
    #  info "Restarting push worker processes on #{host}"
    #
    #  within current_path do
    #    num_resque_workers = capture("sudo monit summary | grep 'em_push_' | grep -v grep").split("\n").length
    #    num_resque_workers.times do |i|
    #      info "Restarting EM push resque worker #{i} on #{host}"
    #      execute "sudo monit restart em_push_#{i}"
    #    end
    #  end
    #end
    #
    ## Wait a few seconds between each restart so we don't have a period where we have no workers at all
    #on roles(:sidekiq), in: :sequence, wait: SECONDS_APART do |host|
    #  info "Restarting Sidekiq worker processes on #{host}"
    #
    #  num_sidekiq_workers = capture("sudo monit summary | grep 'sidekiq_' | grep -v grep").split("\n").length
    #  num_sidekiq_workers.times do |i|
    #    info "Restarting sidekiq worker #{i} on #{host}"
    #    execute "sudo monit restart sidekiq_#{i}"
    #  end
    #end

    hot_restart_unicorn()
  end

  after :finishing, 'deploy:cleanup'
end

