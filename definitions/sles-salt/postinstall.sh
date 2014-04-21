#
# postinstall.sh
#

date > /etc/vagrant_box_build_time

# remove zypper locks on removed packages to avoid later dependency problems
zypper --non-interactive rl  \*

# install vagrant key
echo -e "\ninstall vagrant key ..."
mkdir -m 0700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant.users /home/vagrant/.ssh

# update sudoers
echo -e "\nupdate sudoers ..."
echo -e "\n# added by veewee/postinstall.sh" >> /etc/sudoers
echo -e "vagrant ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers

# speed-up remote logins
echo -e "\nspeed-up remote logins ..."
echo -e "\n# added by veewee/postinstall.sh" >> /etc/ssh/sshd_config
echo -e "UseDNS no\n" >> /etc/ssh/sshd_config

# install the virtualbox guest additions
echo -e "\ninstall the virtualbox guest additions ..."
zypper --non-interactive remove `rpm -qa virtualbox-guest-*` >/dev/null 2>&1
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
#wget http://192.168.178.10/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f VBoxGuestAdditions_$VBOX_VERSION.iso

# Add an online copy of the SLES DVD1 as a software repository, instead of the mounted DVD
zypper removerepo 'SUSE-Linux-Enterprise-Server-11-SP3 11.3.3-1.138'
zypper addrepo 'http://demeter.uni-regensburg.de/SLES11SP3-x64/DVD1/' 'SLES11SP3-x64 DVD1 Online'
zypper addrepo 'http://download.opensuse.org/repositories/devel:languages:python/SLE_11_SP3/devel:languages:python.repo' 
zypper mr --refresh "SLES11SP3-x64 DVD1 Online"
zypper mr --no-gpgcheck "SLES11SP3-x64 DVD1 Online"
zypper mr --refresh "Python Modules (SLE_11_SP3)"
zypper mr --no-gpgcheck "Python Modules (SLE_11_SP3)"

zypper --non-interactive --no-gpg-checks install --force-resolution --auto-agree-with-licenses --force git git-core
zypper --non-interactive --no-gpg-checks install --force-resolution --auto-agree-with-licenses --force salt salt-master salt-minion
zypper --non-interactive --no-gpg-checks install --force-resolution --auto-agree-with-licenses --force libsnappy1 snappy-devel

