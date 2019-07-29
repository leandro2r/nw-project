package 'build-essential'

directory '/opt/nw-project' do
  recursive true
end 

cookbook_file '/opt/nw-project/docker-compose.yml' do
  source 'docker-compose.yml'
end

cookbook_file '/etc/systemd/system/nw.service' do
  source 'extras/system/nw.service'
end

cookbook_file '/usr/local/bin/nw' do
  source 'extras/daemon/nw'
  mode '0755'
end

service 'nw.service' do
  action :start
  supports enable: true, start: true, stop: true, restart: true
end
