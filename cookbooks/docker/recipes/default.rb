package 'build-essential'
package 'docker.io'

cookbook_file '/usr/local/bin/docker-compose' do
  source 'docker-compose'
  mode '0755'
end

group 'docker' do
  append true
  members 'vagrant'
end

service 'docker' do
  action :start
  supports enable: true, start: true, stop: true, restart: true
end
