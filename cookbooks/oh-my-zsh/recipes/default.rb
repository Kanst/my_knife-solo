#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
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
#



node['oh_my_zsh']['users'].each do |u|

  git "/home/#{u}/.oh-my-zsh" do
  repository "https://github.com/Kanst/oh-my-zsh"
  reference "master"
  action :sync
  end 

  template "/home/#{u}/.zshrc" do
    source "zshrc.erb"
    mode 0774
    action :create
  end
end