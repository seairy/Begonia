# -*- encoding : utf-8 -*-
set :stage, :staging
set :branch, 'master'
set :deploy_user, 'master'

server '182.92.188.221', user: 'master', roles: %w{web app db}, primary: true

set :deploy_to, "/srv/www/Begonia"
set :rails_env, :production
