#
# Cookbook Name:: docker
# Recipe:: default
#
bash "add yum repository" do
  code <<-EOS
    tee #{node['docker']['repo']} <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=#{node['docker']['base-url']}
enabled=1
gpgcheck=1
gpgkey=#{node['docker']['gpgkey']}
EOF
  EOS
  not_if { File.exists?("#{node['docker']['repo']}") }
end

package "docker-engine" do
  action :install
  not_if "rpm -q docker-engine"
end

service "docker" do
 supports :status => true, :restart => true
 action [:enable, :start]
end

bash "install docker-compose" do
  code <<-EOS
    curl -L #{node['docker']['compose']['download-url']}-`uname -s`-`uname -m` > #{node['docker']['compose']['install-path']}
    chmod +x #{node['docker']['compose']['install-path']}
  EOS
  not_if { File.exists?("#{node['docker']['compose']['install-path']}") }
end
