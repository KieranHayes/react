set :stages, %w(staging production) 
set :default_stage, "staging"
require "capistrano/ext/multistage"
require "bundler/capistrano"
set :application, "reactualize"
set :hostname, "reactualize.dkd.local"
set :user, "vagrant"
set :host, "#{user}@#{hostname}"

set :scm, :git
set :repository,  "git@github.com:KieranHayes/react.git"
set :use_sudo, false
ssh_options[:forward_agent] = true
default_run_options[:pty] = true


set :deploy_via, :remote_cache
set :runner, user
set :keep_releases, 10

role :app, "reactualize.dkd.local"
role :web, "reactualize.dkd.local"
role :db,  "reactualize.dkd.local", :primary => true

namespace :deploy do
  desc "Restart Unicorn"
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :symlink_config, :roles => :app do
    #run "ln -sf #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
    #run "ln -sf #{deploy_to}/shared/aws_access_key_id.txt #{release_path}/config/aws_access_key_id.txt"
    #run "ln -sf #{deploy_to}/shared/aws_secret_access_key.txt #{release_path}/config/aws_secret_access_key.txt"
    #run "ln -sf #{deploy_to}/shared/csrf_secret_token.txt #{release_path}/config/csrf_secret_token.txt"
  end

end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, 'vendor','bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    run "bundle install --gemfile #{release_path}/Gemfile --path /var/www/react/shared/bundle --deployment --without cucumber test"
    bundler.create_symlink
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release', "deploy:symlink_config"
after "deploy:update", "deploy:cleanup"