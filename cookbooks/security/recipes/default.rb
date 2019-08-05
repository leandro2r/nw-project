package 'openssh-server'

cookbook_file '/etc/hosts.allow' do
  source 'hosts.allow'
end

service 'sshd.service' do
  action :restart
end
