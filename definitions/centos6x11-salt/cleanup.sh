yum -y clean all
rm -rf /etc/yum.repos.d/puppetlabs.repo
rm -rf VBoxGuestAdditions_*.iso

# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/udev/rules.d/70-persistent-net.rules
rm -f /etc/salt/minion_id
rm -rf /etc/salt/pki
