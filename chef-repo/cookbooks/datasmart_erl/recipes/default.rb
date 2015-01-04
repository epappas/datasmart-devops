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

include_recipe 'build-essential'
include_recipe 'openssl'  if node['couch_db']['install_openssl']
include_recipe 'erlang'   if node['couch_db']['install_erlang']
include_recipe 'git'      if node['couch_db']['install_git']

app_tar_gz = File.join(Chef::Config[:file_cache_path], '/', "datasmart_erl-#{node['datasmart_erl']['version']}.tar.gz")

remote_file app_tar_gz do
  checksum node['datasmart_erl']['checksum']
  source node['datasmart_erl']['src_archive']
end

bash "install datasmart_erl #{node['datasmart_erl']['version']}" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -zxf #{app_tar_gz}
    cd datasmart_erl-#{node['datasmart_erl']['version']}/datasmart_erl && make clean && make all && make package
    mv rest_store /usr/local/var/lib/rest_store
  EOH
end

user 'datasmart_erl' do
  home '/usr/local/var/lib/rest_store'
  comment 'datasmart_erl user'
  supports :manage_home => false
  system true
end

%w{ var/lib/rest_store var/log/rest_store var/run/rest_store etc/rest_store }.each do |dir|
  directory "/usr/local/#{dir}" do
    owner 'datasmart_erl'
    group 'datasmart_erl'
    mode '0770'
  end
end

# template '/usr/local/etc/rest_store/local.ini' do
#   source 'local.ini.erb'
#   owner 'datasmart_erl'
#   group 'datasmart_erl'
#   mode 0660
#   variables(
#       :config => node['datasmart_erl']['config']
#   )
#   notifies :restart, 'service[rest_store]'
# end
#
# cookbook_file '/etc/init.d/rest_store' do
#   source 'rest_store.init'
#   owner 'root'
#   group 'root'
#   mode '0755'
# end
#
# service 'rest_store' do
#   supports [:restart, :status]
#   action [:enable, :start]
# end
