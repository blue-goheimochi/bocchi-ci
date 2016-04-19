#
# Cookbook Name:: docker
# Attributes:: default
#
default['docker']['repo'] = '/etc/yum.repos.d/docker.repo'
default['docker']['base-url'] = 'https://yum.dockerproject.org/repo/main/centos/$releasever/'
default['docker']['gpgkey'] = 'https://yum.dockerproject.org/gpg'
default['docker']['compose']['install-path'] = '/usr/bin/docker-compose'
default['docker']['compose']['download-url'] = 'https://github.com/docker/compose/releases/download/1.6.2/docker-compose'
