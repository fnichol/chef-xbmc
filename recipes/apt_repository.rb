#
# Cookbook Name:: xbmc
# Recipe:: apt_repository
#
# Copyright 2010, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "apt"

%w{python-software-properties pkg-config}.each do |pkg|
  package pkg
end

bash "add-xbmc-apt-repository" do
  user "root"
  code %{add-apt-repository ppa:team-xbmc-svn/ppa}
  notifies :run, resources(:execute => "apt-get update"), :immediately
  creates "/etc/apt/sources.list.d/team-xbmc-svn-ppa-#{node[:lsb][:codename]}.list"
end
