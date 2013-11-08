# Install Puppet

gem install puppet facter --no-ri --no-rdoc
mkdir /etc/puppet
mkdir /var/lib/puppet
groupadd -g 502 puppet
useradd -u 501 -g 502 puppet

