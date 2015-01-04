#
# Cookbook Name:: datasmart_erl
# Recipe:: default
#
# Copyright 2015, evalonlabs
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Basics
# ==========================================
default['datasmart_erl']['version']       = '0.0.1-alpha'
default['datasmart_erl']['src_archive']   = "https://github.com/epappas/datasmart/archive/#{node['datasmart_erl']['version']}.tar.gz"
default['datasmart_erl']['checksum']      = "525D7635508A62B9DD4AB366DD1AB976"

# Config
# ==========================================
default['datasmart_erl']['config']['install_erlang']  = true
default['datasmart_erl']['config']['install_git']     = true
default['datasmart_erl']['config']['install_openssl'] = true
default['datasmart_erl']['config']['log']['level']    = 'info'

# Config - app
# ==========================================
default['datasmart_erl']['config']['app']['cwd']    = '/usr/src'

# Config - httpd
# ==========================================
default['datasmart_erl']['config']['httpd']['port']           = 4421
default['datasmart_erl']['config']['httpd']['bind_address']   = '127.0.0.1'

# Config - CouchDB
# ==========================================
default['datasmart_erl']['config']['couchdb']['port']    = ''
default['datasmart_erl']['config']['couchdb']['host']    = ''

# Config - CouchDB - AUTH
# ==========================================
default['datasmart_erl']['config']['couchdb']['auth_type']       = ''
default['datasmart_erl']['config']['couchdb']['auth_username']   = ''
default['datasmart_erl']['config']['couchdb']['auth_password']   = ''
