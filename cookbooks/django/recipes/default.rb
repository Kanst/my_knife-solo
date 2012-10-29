

easy_install_package "django-registration" do
  options "-Z"
  action :install
end	


easy_install_package "django-tagging" do
  action :install
end	

easy_install_package "south" do
  action :install
end	

easy_install_package "django-markitup" do
  action :install
end	

easy_install_package "django-tagging" do
  action :install
end	

package "python-psycopg2"

package "python-markdown"