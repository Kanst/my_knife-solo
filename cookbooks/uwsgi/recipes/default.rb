#include_recipe "python"
include_recipe "nginx"
# needed for uwsgi starting with version 1.3
package "libssl0.9.8" do
  action :upgrade
end

#package "python-pip"
#package "build-essential"
package "python-dev"
package "libxml2-dev"
package "uwsgi"
package "uwsgi-plugin-python"
package "python-virtualenv"

 #Устанавливаем конфиги
node['uwsgi']['apps'].each do |a|

  template "/etc/uwsgi/apps-available/#{a}.ini " do
    source "uwsgi.erb"
    mode 0774
    variables( :apps => a )
    action :create
  end

  template "/etc/nginx/sites-available/#{a}" do
    source "nginx.erb"
    mode 0774
    variables( :apps => a )
    action :create
  end


script "ln_uwsgi" do
  interpreter "bash"
  user "root"
  cwd "/"
  code <<-EOH
  ln -s /etc/uwsgi/apps-available/#{a}.ini /etc/uwsgi/apps-enabled/
  EOH
end

script "ln_nginx" do
  interpreter "bash"
  user "root"
  cwd "/"
  code <<-EOH
  ln -s /etc/nginx/sites-available/#{a} /etc/nginx/sites-enabled/
  EOH
end
end


