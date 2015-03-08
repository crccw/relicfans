# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'relicfans'
set :repo_url, 'https://github.com/crccw/relicfans'
set :branch, 'master'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/relicfans'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml');

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public', 'config/unicorn')

# Default value for default_env is {}
set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :rvm1_ruby_version, "2.2.0"

before 'deploy', 'rvm1:install:rvm'
before 'deploy', 'rvm1:install:ruby'

namespace :deploy do
  task :install_bower do
    on roles(:app) do
      within release_path do
        execute :rake, 'bower:install'
        execute :rake, 'bower:resolve'
      end
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  before 'assets:precompile', :install_bower

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end