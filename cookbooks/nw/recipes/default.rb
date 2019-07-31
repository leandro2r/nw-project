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

cookbook_file '/usr/local/sbin/nw' do
  source 'extras/daemon/nw'
  mode '0755'
end

if node['nw']['swarm'] == 'join'
  TOKEN = `cat /tmp/swarm/swarm.token`.strip
  SWARM_INIT = `cat /tmp/swarm/ip.txt`.strip

  file '/tmp/swarm/swarm.token' do
    action :nothing
  end

  file '/tmp/swarm/ip.txt' do
    action :nothing
  end

  execute 'Docker swarm join' do
    command "docker swarm join --token #{TOKEN} #{SWARM_INIT}:2377"
    notifies :delete, 'file[/tmp/swarm/swarm.token]', :delayed
    notifies :delete, 'file[/tmp/swarm/ip.txt]', :delayed
  end
else
  execute 'Docker swarm init' do
    command "docker swarm init --advertise-addr #{node['ipaddress']}"
  end

  execute 'Add ipaddress to share' do
    command "echo #{node['ipaddress']} > /tmp/swarm/ip.txt"
  end

  execute 'Add swarm token to share' do
    command 'docker swarm join-token -q manager > /tmp/swarm/swarm.token'
  end
end

service 'nw.service' do
  action :start
  supports enable: true, start: true, stop: true, restart: true
end
