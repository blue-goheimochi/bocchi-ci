#
# Cookbook Name:: php
# Recipe:: default
#
package "php" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php"
end

package "php-mcrypt" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-mcrypt"
end

package "php-pdo" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-pdo"
end

package "php-mbstring" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-mbstring"
end

package "php-xml" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-xml"
end

package "php-pecl-uopz" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-pecl-uopz"
end

package "php-soap" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-soap"
end

package "php-pecl-xdebug" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-pecl-xdebug"
end

package "php-pecl-redis" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-pecl-redis"
end

package "php-mysql" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-mysqlnd"
end

package "php-bcmath" do
  action :install
  options "--enablerepo=remi,remi-php56"
  not_if "rpm -q php-bcmath"
end

template "/etc/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute "install composer" do
  command <<-EOS
    curl -sS #{node['php']['composer']['url']} | php -- --install-dir=#{node['php']['composer']['install-dir']}
    ln -s #{node['php']['composer']['install-dir']}composer.phar #{node['php']['composer']['bin']}
    ln -s #{node['php']['composer']['bin']} #{node['php']['composer']['bin-symlink']}
  EOS
  not_if { File.exist?("#{node['php']['composer']['bin']}") }
end
