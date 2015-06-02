set :stage, :staging
set :branch, 'staging'
set :tmp_dir, '/data/tmp'

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
server 'localhost',
       user: 'deployer',
       roles: %w{web app db},
       ssh_options: {
           user:          'deployer',
           auth_methods:  %w(publickey),
           forward_agent: true,
           port: 2222,
           keys: %w(/Users/sahilm/src/bigbinary/boxy/.vagrant/machines/default/virtualbox/private_key)
       }

set :rails_env, :staging
fetch(:default_env).merge!(rails_env: :staging)

after 'deploy:finished', 'git:release:tag'
