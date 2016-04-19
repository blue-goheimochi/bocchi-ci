#
# Cookbook Name:: jenkins
# Attributes:: default
#
default['jenkins']['repo_url']  = "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
default['jenkins']['repo_path'] = "/etc/yum.repos.d/jenkins.repo"
default['jenkins']['repo_key']  = "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
default['jenkins']['port']      = "8080"

default['jenkins']['cli-install-dir']  = "/usr/local/jenkins-cli"

default['jenkins']['plugin'] = [
  "http://updates.jenkins-ci.org/download/plugins/junit/1.12/junit.hpi",
  "http://updates.jenkins-ci.org/download/plugins/xunit/1.101/xunit.hpi",
  "http://updates.jenkins-ci.org/download/plugins/seleniumhq/0.4/seleniumhq.hpi",
  "http://updates.jenkins-ci.org/download/plugins/seleniumhtmlreport/1.0/seleniumhtmlreport.hpi",
  "http://updates.jenkins-ci.org/download/plugins/phing/0.13.3/phing.hpi",
  "http://updates.jenkins-ci.org/download/plugins/envinject/1.92.1/envinject.hpi",
  "http://updates.jenkins-ci.org/download/plugins/script-security/1.18.1/script-security.hpi"
  "http://updates.jenkins-ci.org/download/plugins/matrix-project/1.6/matrix-project.hpi"
  "http://updates.jenkins-ci.org/download/plugins/throttle-concurrents/1.9.0/throttle-concurrents.hpi"
]