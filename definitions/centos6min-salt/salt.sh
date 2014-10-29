yum -y install python-devel python-argparse salt-master salt-minion python-halite --enablerepo epel-testing
pip install gitdb GitPython 
#salt==2014.7.0rc4

for svc in master minion syndic
do
  chkconfig salt-${svc} off
done

