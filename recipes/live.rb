#
# Cookbook Name:: xbmc
# Recipe:: live
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

include_recipe "users::sysadmins"
include_recipe "xbmc::apt_repository"
include_recipe "xbmc::core"

home_dir = "/home/xbmc"

user "xbmc" do
  comment   "XBMC User"
  shell     "/bin/bash"
  supports  :manage_home => true
  home      home_dir
end

directory "#{home_dir}" do
  owner "xbmc"
  group "xbmc"
  mode  "2755"
end

# add xbmc user to required groups
%w{audio video fuse cdrom plugdev sysadmin}.each do |grp|
  group grp do
    append true
    members ["xbmc"]
  end
end

cookbook_file "/etc/sudoers.d/xbmc" do
  mode 00440
end

%w{xbmc-live policykit-1 upower}.each do |pkg|
  package pkg
end

cookbook_file "/var/lib/polkit-1/localauthority/50-local.d/custom-actions.pkla"
