package 'build-essential'

directory '/opt/nw-project' do
  recursive true
end

cookbook_file '/opt/nw-project/docker-compose.yml' do
  source 'docker-compose.yml'
end

execute 'Add swarm token to share' do
  cwd '/opt/nw-project'
  command 'docker-compose pull'
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

  file '/tmp/swarm/swarm.token' do
    action :nothing
  end

  execute 'Docker swarm join' do
    command "docker swarm join --token #{TOKEN} #{node['nw']['swarm_init']}:2377"
    notifies :delete, 'file[/tmp/swarm/swarm.token]', :delayed
  end
else
  execute 'Docker swarm init' do
    command "docker swarm init --advertise-addr #{node['nw']['swarm_init']}"
  end

  execute 'Add swarm token to share' do
    command 'docker swarm join-token -q manager > /tmp/swarm/swarm.token'
  end
end

service 'nw.service' do
  action :start
  supports enable: true, start: true, stop: true, restart: true
end
