# Base install

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils yum-utils tree sysstat strace tcpdump nmap atop python-pip git redhat-lsb-core ntp snappy snappy-devel telnet lsof vim-enhanced docker-io

yum -y install ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/pssh-2.3-1.el6.rf.noarch.rpm

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config
