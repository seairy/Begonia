# -*- encoding : utf-8 -*-
set :stage, :staging
set :branch, 'master'
set :deploy_user, 'seairy'

server '60.247.115.253', port: 3030, user: 'root', roles: %w{web app db}, primary: true

set :deploy_to, "/srv/www/Begonia"
set :rails_env, :production

set :config_files, %w(
  abc
)