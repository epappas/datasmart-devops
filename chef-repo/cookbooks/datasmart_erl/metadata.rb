name             'datasmart_erl'
maintainer       'evalonlabs'
maintainer_email 'epappas@evalonlabs.com'
license          'All rights reserved'
description      'Installs/Configures datasmart_erl'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'build-essential'
depends 'openssl'
depends 'erlang'
depends 'couchdb'
depends 'nodejs'
depends 'redisio'
depends 'chef-client'
depends 'git'
depends 'pm2'

